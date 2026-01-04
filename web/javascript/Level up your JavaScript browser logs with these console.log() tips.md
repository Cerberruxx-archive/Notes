---
title: "Level up your JavaScript browser logs with these console.log() tips"
source: "https://dev.to/ackshaey/level-up-your-javascript-browser-logs-with-these-console-log-tips-55o2"
author:
  - "[[Ackshaey Singh]]"
published: 2020-11-02
created: 2025-10-15
description: "I consider myself a backend software engineer - and as any backend engineer would attest, a large... Tagged with javascript, devops, monitoring, productivity."
tags:
  - "clippings"
---
I consider myself a backend software engineer - and as any backend engineer would attest, a large part of our life is spent monitoring, troubleshooting, and debugging our applications. The fundamental rule of software development is that software will fail - what separates new developers from experienced ones is how they plan for those failures. Robust and effective logging is an important part of planning for failure, and eventual mitigation. As it is for backend development, logging can be useful for frontend software development, but it goes much further than just troubleshooting and debugging. Effective frontend logging can also make the development experience productive, fast, and fun.

While I’m a big proponent and diligent practitioner of Test-driven development, I love the flexibility, the richness of information, and code confidence browsers provide to frontend developers who make effective use of `console.log()`. I thought I’d share some frontend logging tips and tricks I’ve learned and incorporated in my workflow over time while building [Firecode.io](https://firecode.io/) - in the hope that some of these will help you make your development workflow a bit more productive and fun!

I like to divide these tips into two broad categories - quick n’ dirty logging for when you’re actively building and debugging your application, and durable production logging - to know when your app’s working as expected and when it’s not.

## Tips for quick n’ dirty development logging with console.log()

### Don’t use console.log().

Yes, that’s right. I don’t use `console.log()`. Well, ok I write wrappers that use `console.log()` (more on that in the production logging section), but if you want to log something in your app to see what’s going on, use `console.trace()` instead. In addition to giving you everything `console.log()` does, it also outputs the entire stack trace so you know where exactly the message is emitted from.

[![02](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fg87cv03r0q8qjt6405xq.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fg87cv03r0q8qjt6405xq.png)

### Use ES6’s computed property names to identify your objects and avoid variable name confusion

This one is straightforward - use ES6’s computed property syntax and wrap the objects you wish to log in curly braces inside `console.log()` - i.e. use `console.log({user})` vs `console.log(user)`. You’ll find them neatly logged with the variable name set as the key, and the value as the object itself. This is especially useful when you’re in a hurry and want to log multiple objects in the same `console.log()` command.

[![03](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fvxvffyxht8768nf5zxns.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fvxvffyxht8768nf5zxns.png)

### Embrace tiered log levels - error, warn, info

`console.log(param)` by default logs at the `INFO` level - however, you also have 3 other logging levels at your disposal which you should make use of - `console.debug()`, `console.warn()` and `console.error()`. Besides formatting differences (notice the different colors?), the browser’s developer console also lets you easily filter out logs at different levels with a convenient dropdown to declutter your logs.

[![04](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fue6ofcm2xsagy1moazhm.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fue6ofcm2xsagy1moazhm.png)

[![04](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fp1exgw4wpithm5roqz3k.gif)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fp1exgw4wpithm5roqz3k.gif)

### When logging lists of items, use console.table()

This one is self-explanatory and one of my favorite console functions - if you ever need to log a list of objects, give `console.table()` a try.

[![05](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fw4pojt1jpusdmxzh197s.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fw4pojt1jpusdmxzh197s.png)

### Quickly debug with debugger

Want to save a precious few seconds? Instead of finding your file in the developer console to add a breakpoint, drop a `debugger` in your code to halt execution when the line is executed. From this point on, you can debug and step over / into functions as you normally would.

[![06](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ff2a5wu93urj3vseiu9km.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ff2a5wu93urj3vseiu9km.png)

[![08](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ff8g64nypjsa184izvk4h.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ff8g64nypjsa184izvk4h.png)

### Granular performance profiling with console.profile() and console.time()

Want to profile an exact user flow in your application to find hot spots? Trigger `console.profile(profileName)` at the start of the action, and `console.profileEnd(profileName)` at the end to inspect the CPU profile for the flow.

[![09](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fmmwhq6y9v6g9h4cyfozu.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fmmwhq6y9v6g9h4cyfozu.png)

[![10](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fnf9l86rj4xy1opslbeyc.gif)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fnf9l86rj4xy1opslbeyc.gif)

Related, you can measure exactly how long a flow takes with triggering `console.time(id)` at the start of the flow, and `console.timeEnd(id)` at the end.

[![11](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ftyy3zc7hisr4yofyvvap.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ftyy3zc7hisr4yofyvvap.png)

### Count labelled executions with console.count()

This one’s one of those console functions I haven’t found much use for personally, but it’s there if you need it. `console.count(label)` can help you know exactly how many times a piece of code gets executed - which could be useful for finding and eliminating race conditions and other scenarios.

[![12](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2F573ovm53jehapshlqb36.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2F573ovm53jehapshlqb36.png)

### Prettify your logging with CSS

This is by far my favorite console feature and one I make extensive use of in production logging (more on this in the production logging section). You can make use of format strings to format your log messages. The `%c` is the placeholder for CSS styles, and anything after is your message.

[![13](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fzbmsic8qu3e5pqe3c9am.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fzbmsic8qu3e5pqe3c9am.png)

You can also style multiple elements by extending your format string to include `%s` for string parameters.

[![14](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ffbtlflkigkemdqd7vsae.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Ffbtlflkigkemdqd7vsae.png)

Since I’m a highly visual person, I like to spend some time making my info and debug logs look pretty and be useful at the same time. I make extensive use of this feature for production logging in Firecode.io - which is an excellent segue for the next section.

[![15](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fln4g1ivwiqgc86egr26v.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fln4g1ivwiqgc86egr26v.png)

## Production logging with console.log()

Getting frontend code production ready involves a number of steps - some being uglifying and compressing your code, generating cacheable asset digests, and removing `console.log()` s from your app. Why? Because you don’t want your users to have to open the developer console to interact with your app, which nullifies the usefulness of your logs and leaves them as pure security holes for the more inquisitive to take advantage of. At the same time, when *you* use your own app, you most likely want the most granular level of logging to understand how your app is functioning and find and squash bugs. If your app is being used by others, you’d also want to be notified when your application’s users encounter errors so you can track down and fix your code. Here’s a couple of things I do to satisfy these requirements as best one could on the frontend:

### Don’t use console.log()

Instead, write a wrapper class that includes logic for conditionally logging based on the log level based set on a global variable by the backend. Warning - you’ll see TypeScript code snippets ahead - if you’re not familiar with TypeScript, think of it as a superset of JavaScript with types tacked on (gross over-simplification) - i.e. `const str = “some string”;` becomes `const str: string = “some string”` - types are added after a variable followed by a semicolon.

In the case of Firecode.io, I wrote my own frontend framework that utilizes RxJS, but includes familiar concepts such as components from other popular frameworks such as React and Vue - while adding additional concepts such as engines for processor-heavy code blocks, channels for WebSocket messages, and clients for HTTP requests. Visualizing all these pieces working together was critical, so I implemented custom formatting in a `Logger` wrapper class that formats and visually differentiates logs from each part of the application.

[![17](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fze7utc9dr1qx7sfkqwsq.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fze7utc9dr1qx7sfkqwsq.png)

Instead of calling `console.log("Cache SET to", {value})`, I call `Logger.debug(“Cache set to”, {value}, Framework.Cache)`. The `Logger` class has a TypeScript enum that maps each framework component to the color to be used:

[![18](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2F9l9aoiuctz9rprzfky2u.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2F9l9aoiuctz9rprzfky2u.png)

This allows me to visually focus on components of the app during development - for example, if I want to see what the `WsRequestCache` is doing I can tune out everything else besides the turquoise badged logs.

### Protect your logs by having the backend set your log level

I have Firecode.io configured to turn on debug level logging by default for admin users with a JavaScript variable that is set by the backend. While adventurous users can still find and set these flags in the developer console to turn on granular logging, it is better than having all logs exposed to every user of your application by default, or having a post-processor remove all logging completely from your application in production.

Set in a Ruby on Rails view:  
`const logLevel: number = <%= @app.get_log_level_for_user %>`

And in the Logger class:

```
class Logger {
   ...
   ...
   static info(...) {
     shouldLog(Level.INFO) && console.log(...);
        ...
   }
}
```

### Log and notify on actionable errors

Last but not least, you want to be notified when exceptional conditions are encountered by users without necessarily outputting logs to the developer console. You can do this by including a call to pipe your errors to a third party APM service such as [AppSignal](https://appsignal.com/r/3a311c33b0) in your Logger‘s error function like so:

```
class Logger {
   ...
   ...
   static error(e) {
     if (shouldLog(Level.ERROR)) {
       console.error(e);
     }
     appsignal.sendError(e);
   }
}
```

[AppSignal](https://appsignal.com/r/3a311c33b0) includes integrations to pipe your errors to outbound notifications services such as Slack, PagerDuty, and OpsGenie - you can even hook up a project management tool such as JIRA or Trello to automatically create issues and bugs for your team.

## Summary

I really hope these tips and anecdotes make your frontend development experience a little more productive and fun! I’ve obviously only touched the surface of logging ninjitsu in this post, so if you have any more tips to share I’d love to read them over on my [Twitter](https://twitter.com/ackshaey).

[![plug](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fagzozoxegvkrz9pah69b.png)](https://media2.dev.to/dynamic/image/width=800%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fi%2Fagzozoxegvkrz9pah69b.png)

Two parting plugs - I’m rebuilding Firecode.io from the ground up with a brand new set of coding interview questions for JavaScript, Java, Python, and Scala. If you’re interested in coding interview prep that adapts to your learning style and is fun - sign up with your email [here](https://firecode.io/) I’ll also be putting out more content about building a production scale web app like Firecode.io from scratch as a side project - follow me at [@ackshaey](https://twitter.com/ackshaey) or [@firecodeio](https://twitter.com/firecodeio) to learn more. Lastly, if you’re new to JavaScript and want to understand how object-oriented JavaScript and prototypal inheritance work under the hood, check out my favorite book on the subject - [The Principles of Object-Oriented JavaScript](https://amzn.to/2JhHB1V*), and if you’re interested in learning more about why you should use TypeScript instead, check out [Effective TypeScript](https://amzn.to/3jQ5ZnQ).

[![DevCycle image](https://media2.dev.to/dynamic/image/width=775%2Cheight=%2Cfit=scale-down%2Cgravity=auto%2Cformat=auto/https%3A%2F%2Fi.imgur.com%2FzMQ8GSC.png)](https://www.devcycle.com/accelerate-releases?utm_source=tldr&utm_medium=cpc&utm_campaign=openfeature&utm_content=acceleratedreleases&bb=237283)

## Ship Faster, Stay Flexible.

DevCycle is the first feature flag platform with OpenFeature built-in to every open source SDK, designed to help developers ship faster while avoiding vendor-lock in.