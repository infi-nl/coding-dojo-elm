
# elm-quizapp-dojo

----
**⚠ Warning:** This repository is _frozen in time_, and getting no new (security) updates. It is left public, should it help and offer some guidance around its subjects to future visitors. However, for latest guidance on involved subjects, we recommend going to the official sources.
----

Basic Elm implementation of a QuizApp (using the [Infi Quiz API](http://infi-dojo-quizapi.azurewebsites.net/question/random)) to be used during the Infi Coding Dojo in October 2016.

## Development environment setup (using VS Code)

1. Install [nodejs](https://nodejs.org/en/download/) if you don't have it yet. (Needed for _elm-repl_ to work.)
2. Install the [Elm Platform](https://guide.elm-lang.org/get_started.html#install) (currently version 0.17.1).
3. Install [Visual Studio Code](https://code.visualstudio.com/Download).
4. Download Elm format (look for the download link in [this page](https://github.com/avh4/elm-format#installation-)). Make sure you download the right version for the Elm Platform version that you installed (so at the moment [For Elm 0.17](https://github.com/avh4/elm-format#for-elm-017)).  Currently the downloaded archive contains 1 executable (the Windows download anyway), called _elm-format.exe_. Make sure you place this executable in a folder that is in your PATH environment variable.

After downloading and installing these tools, when you open a command prompt, you should be able to invoke the commandline tools (like e.g. _elm-format_, _elm-repl_ and _elm-reactor_).

What remains now is setting up VS Code for Elm development. There are 2 plugins available for VS Code that help with Elm development:
- [elm](https://marketplace.visualstudio.com/items?itemName=sbrink.elm). Currently version 0.8.2. It can be installed by hitting Ctrl+P (Mac: Cmd+P) and typing "ext install elm". This plugin provides (amongst others) syntax and error highlighting, function information (hover over a function and get the signature) and autocompletion.
- [elm-format](https://marketplace.visualstudio.com/items?itemName=abadi199.elm-format). Currently version 0.1.0. Install with Ctrl+P (Mac: Cmd+P) and "ext install elm-format". This plugin provides autoformatting of your code by hitting Ctrl+Shift+P (Mac: Cmd+Shift+P) and typing "elm format", or with the shortcut Shift+Alt+F.

Make sure you restart VS Code after installing the plugins.

When all this is done, you should see syntax highlighting when opening an Elm file (filename extension _.elm_), and formatting using Shift+Alt+F should work.

## Running elm

1. Clone this repository to your local machine. *Please note: due to a [bug](https://github.com/sbrink/vscode-elm/issues/75) in the [vscode-elm plugin](https://marketplace.visualstudio.com/items/sbrink.elm), error highlighting does not work in VS Code if there's a space in the folder structure that you clone the repository into.*
2. In your command line tool:
  - navigate to the directory coding-dojo-elm
  - run 'elm-make' and follow the instructions to install the necessary elm packages
  - run 'elm-reactor' to start a web server running your web application
3. Browse http://localhost:8000/static/index.html to see the result
4. If you see the text 'Infi Elm Quiz App' then you have done everything successfully!

## Assignment

The goal of this coding dojo is to build your own QuizApp web application with Elm, using the provided QuizApp API. More specifically:

1. Retrieve and display a question.
2. Display the possible answers.
3. Allow a user to select an answer, verify the answer and show the result.

Additional ideas:
- Keep score (e.g. how many questions seen total, how many correct answers and wrong answers given, ...).
- Display average time taken per question.
- Only allow a certain amount of time to answer a question.
- Use your imagination!
