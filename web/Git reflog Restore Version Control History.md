---
title: "Git reflog: Restore Version Control History"
source: "https://medium.com/dfind-consulting/restore-commit-history-with-git-reflog-67f7676e902f"
author:
  - "[[Marius Ibsen]]"
published: 2022-08-09
created: 2025-10-15
description: "Did you know we can use Git reference logs to restore history in the commit log(?) Often we developers experience challenges when working with Git. We can accidentally force-push commits to the…"
tags:
  - "clippings"
---
[Sitemap](https://medium.com/sitemap/sitemap.xml)## [Dfind Consulting](https://medium.com/dfind-consulting?source=post_page---publication_nav-76d4e27cc6e4-67f7676e902f---------------------------------------)

[![Dfind Consulting](https://miro.medium.com/v2/resize:fill:76:76/1*2GMbCwtuxk43mjgjQGz9Aw.png)](https://medium.com/dfind-consulting?source=post_page---post_publication_sidebar-76d4e27cc6e4-67f7676e902f---------------------------------------)



![](https://miro.medium.com/v2/resize:fit:640/format:webp/0*NNpIKZmLZ8bDSz79)

Photo by Egor Myznik on Unsplash

Did you know we can use Git reference logs to restore Git commit history(?) Often we developers experience challenges when working with Git. We can accidentally force-push commits to the remote main branch, complete a rebase that went bad, delete a branch we wanted to keep or hard reset to the wrong commit. In this post, we will look at `git reflog` and `git reset`. We will review some common scenarios on restoring local commits, restoring a deleted branch, and reverting force-pushed changes due to a rebase.

## Git reflog

[git reflog](https://git-scm.com/docs/git-reflog) is a tool that can help us recover almost anything — at least everything we have committed. The tool keeps track of commits that have been created but also discarded ones in a log called the reference log. The reference log is kept on our local computer under the `.git` directory in a local repository. It contains a list of commits that `HEAD` has pointed to and keeps track of the entire history of a commit. Besides the reference log for branches, we have a separate reference log for stash.

It’s important to know that reference logs do *not* track in the remote repository, like pushes, fetches and clones; it is purely local and current to the working environment. Below is two screencaps, the first from Github Codespaces and the second from a local filesystem that initially created all the commits of the main branch in the *same* repository:

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*L1DTjYe4kiUo01_95hL-dQ.png)

Reference log from a workspace in Github Codespaces

![](https://miro.medium.com/v2/resize:fit:640/format:webp/1*d175xjAzVotgtgHlFvjtQg.png)

Reference log from local computer where the commits were initially created

Records of the history on a branch will expire after 30 days by default. We can change the expiration days running `git reflog —expire` if we want to keep the history for a longer time or just want to change the duration.

## Git log vs reflog

[git log](https://git-scm.com/docs/git-log) is a command that shows a list of commits related to a branch.`git reflog` is similar to `git log` but shows a list of snapshots and times when `HEAD` was changed. reflog can also reference other types such as *stash*, *branches*, *rebase, merge* and *tags*. A reference is known as *refs*, and the syntax for accessing these is `name@{qualifier}`. Running `git reflog` is the most basic use case and essentially the equivalent of writing `git reflog show HEAD. `The output will look like this:

```c
=> git reflog47efaa2 HEAD@{0}: commit: refactor: remove post schema
f243f12 HEAD@{1}: commit: refactor: change author fields
4783ba0 HEAD@{2}: commit: chore: add .env to gitignore
a19d142 HEAD@{3}: commit: chore: update readme
f5ade9a HEAD@{4}: commit: chore: update yarn.lock
854c08f HEAD@{5}: commit (initial): feat: bootstrap sanity studio
```

## Git reset

[git reset](https://git-scm.com/docs/git-reset) is a command we can use to move back to a previous commit, discarding or undoing previous changes. We can run `git reset --hard <commit_sha>` to move our branch back in the commit history.

- **A hard reset** (`git reset --hard)` will *completely destroy* any changes and remove them from your local repository.
- **A soft reset** (`git reset --soft`) will keep your changes, and stage them back automatically.
- **A mixed reset** (`git reset --mixed`) which is the default, will keep you changes but they will also become unstaged. Even tho it is flexible, you will have to stage the changes manually.

## Restore local commits

### Scenario

We have made some commits that haven’t been pushed to the remote repository yet. We do a `git reset —-hard <commit_sha>` to a previous commit, and our local branch is set back to an earlier point and discarded all history after the chosen commit. We then run `git log` and see that the commits are gone. We cannot pull the changes from the remote repository since we never synced the changes.

### How to restore

When running `git reflog` we can see that our changes still are tracked by the reference log; we even have a separate commit for the hard reset that we did earlier:

```c
f243f12 HEAD@{0}: reset: moving to f243f12
eec6f27 HEAD@{1}: commit: refactor: author should not have image
47efaa2 HEAD@{2}: commit: refactor: remove post schema
f243f12 HEAD@{3}: commit: refactor: change author fields
```

With this information, we can reset our branch back to the state we discarded by using one of the references in the reflog. We can move our branch to the selected commit by running `git reset --hard <commit_sha>`:

```c
=> git reset --hard f243f12
=> git reflogf243f12 HEAD@{0}: reset: moving to eec6f27
f243f12 HEAD@{1}: reset: moving to f243f12
eec6f27 HEAD@{2}: commit: refactor: author should not have image
47efaa2 HEAD@{3}: commit: refactor: remove post schema
f243f12 HEAD@{4}: commit: refactor: change author fields
```

## Restore a deleted branch

We can recover deleted branches using SHA’s in the reference logs.

### Scenario

Not uncommonly, we might checkout a new branch in our local environment. We could have a branch called `chore/update-packages` and commit a change that adds [dayjs](https://day.js.org/) as a package:

```c
=> git checkout -b chore/add-dayjs-package
=> yarn add dayjs
=> git add .
=> git commit -m 'chore: add dayjs package'5a75042 HEAD@{0}: commit: chore: add dayjs package
```

At a later point, we checkout the *main* branch and deletes the `chore/add-dayjs-package` branch — maybe we did not need it anymore for some reason:

```c
=> git checkout main47efaa2 HEAD@{0}: moving from chore/add-dayjs-package to main=> git branch -D chore/add-dayjs-packageDeleted branch chore/add-dayjs-package (was 5a75042)
```

We will get a confirmation message that git deleted the branch. After a while, we discover that we could need the changes after all, so how do we get them back?

### How to restore

We can undo these changes with `git reflog` and `git checkout`. If we run `git reflog` we won’t see any references to the deleted branch. We could use the commit SHA provided in the delete message (`5a75042`) to revert the latest commit on that branch. But if we have lost the message, we need to use the reference log. And if you named your commits well, it should be easy to find the missing commit:

```c
=> git reflog// deletion of a branch is not logged to reflog
47efaa2 HEAD@{0}: moving from chore/add-dayjs-package to main
5a75042 HEAD@{1}: commit: chore: add dayjs package
47efaa2 HEAD@{2}: moving from main to chore/add-dayjs-package
```

We can now checkout the deleted commit SHA and create a new branch from that commit running `git checkout -b <branch_name>`:

```c
=> git checkout 5a75042
=> git checkout -b chore/add-dayjs-package
```

## Revert force-pushed changes

### Scenario

We reset our branch using `git reset —-hard` to an earlier commit and run `git push — force` to override any changes that we otherwise could pull from the remote repository. But at some point, we want those changes back.

```c
=> git reset --hard <commit_sha>
=> git push --force
```

### How to restore

We can use `git reflog` and `git reset` to restore force-pushed changes.

```c
=> git reflog
f243f12 HEAD@{0}: reset: a19d142 to f243f12
```

By the log we can see that the message on `HEAD@{0}` is `reset: a19d142 to f243f12`, which means that commit with hash `a19d142` was force-pushed by `f243f12`. That also gives us information about which commit we need to restore, the one with hash `a19d142`. We can simply do the same procedure as initially to move back to the overriden commit:

```c
git reset --hard a19d142
git push --force
```

Finally, we force-push the new changes to the remote repository. Always be careful and check that you are on the correct branch before doing a force push. Especially to prevent that production code is not being affected or team member code is not being overwritten.

[![Dfind Consulting](https://miro.medium.com/v2/resize:fill:96:96/1*2GMbCwtuxk43mjgjQGz9Aw.png)](https://medium.com/dfind-consulting?source=post_page---post_publication_info--67f7676e902f---------------------------------------)

[![Dfind Consulting](https://miro.medium.com/v2/resize:fill:128:128/1*2GMbCwtuxk43mjgjQGz9Aw.png)](https://medium.com/dfind-consulting?source=post_page---post_publication_info--67f7676e902f---------------------------------------)

[Last published Feb 28, 2023](https://medium.com/dfind-consulting/designing-efficiently-how-to-build-a-design-system-with-limited-resources-a4b36ed16b95?source=post_page---post_publication_info--67f7676e902f---------------------------------------)

Ved hjelp av bred teknologisk kompetanse og solid designhåndtverk skaper vi bærekraftige løsninger for deg og dine kunder

## More from Marius Ibsen and Dfind Consulting

## Recommended from Medium

[

See more recommendations

](https://medium.com/?source=post_page---read_next_recirc--67f7676e902f---------------------------------------)