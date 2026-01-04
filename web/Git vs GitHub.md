From Reddit (r/Kaimito1)


ELI5 version in a way that i understand it:
Git in its most basic form is like checkpoints in a game. Every so often you want a checkpoint so in case you destroy everything, it's okay. You can just restart at a checkpoint.
You play around, level up and want to save your character. First, you need to mark your character and say 'I want to save this. Mark this guy for saving' This is staging a commit (Git add xxx)
You confirm that you want to save the character. Before you do, the game asks you to write a message so you know what this save just did. Once make a message it will save the game TO YOUR CONSOLE (more on this later in the remote bit). Congrats You just did a commit
Turns out the game can save files online so you can pick up on any console. All you have to do is tell it to save the files on your console to the online versions This is the remote repositories
There is a fork in the road and you want to see both ways but not commit. You make a separate save file and go left, while the main one goes right. Each of them can now make checkpoints fully independent of each other. This is Git branching
Eventually you get all the items on each road and you want to combine the save files back into one. As long as nothing conflicts (Path 1 upgraded their stats in the same way path 2 did) and the only new thing is additions (Path 1 character got new boots and path 2 character got a new hat) you can combine them into 1. This is merging branches.
Turns out you cant be assed to start from scratch and your friend has a high level character. You want to see his stat build and how he did it. you copy his save file to your own and look around, mess around, but not save. This is cloning a repository/repo. Also called pulling down a repo (repo in this context is a save file)
You make some changes that you think is better for his character. You have the intention to make it better in your style of gameplay. You clone down a repo in a way that lest you update the save file. This is forking a repo (Forked because as with the branching analogy, you go one way, but the owner of the save file may go a different way)
You do your changes and you want your friend's character to be updated with your better improvements. You can't just overwrite his own save file because that would be a dick move. You have to request that he accepts your changes first. This is a Pull Request
That covers most of it so far. This is just an ELI5 version though so there are more advanced things to know.
As for github vs Git:
You know how pornhub is a place where people store porn? Yep. Github is a place where people store git repos online


**note:

Git is NOT the same as a code IDE such as Visual Studio or notepad++, it’s for STORING code rather than WRITING 

