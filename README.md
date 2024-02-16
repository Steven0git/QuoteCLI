##  The QuoteCLI 🗣️

### What is QuoteCLI? 🤔

QuoteCLI is a handy tool that brings inspirational quotes right to your terminal every time you start a new session. Say goodbye to blank, uninspiring terminals and hello to a daily dose of wisdom and motivation!

### How Does it Work? ✨

QuoteCLI lives within your terminal and works seamlessly with your existing setup. You'll need to make a few small tweaks to unleash its power, but rest assured, it's super easy!

**Installation:**

1. 👍 **Bring QuoteCLI Home:** Open your terminal and clone this repository using the following command:
   ```bash
   git clone https://github.com/Steven0git/QuoteCLI.git
   ```
2. ⚙️ **Navigate to the Source:** Change directories to the newly downloaded QuoteCLI folder:
   ```bash
   cd QuoteCLI
   ```

### **Configuration:** ⚙️

1. 👉 **Open the Magic File:** Choose the appropriate file based on your shell:
    - **Bash:** Open your `bash.bashrc` file.
    - **Zsh:** Open your `.zshrc` file.
    You can usually find these files in your home directory using a text editor like `nano` or `vim`.
2. 👉 **Activate the Engine:** Add the following line to the end of your chosen file, replacing `/path/to/QuoteCLI` with the actual path to your QuoteCLI directory:
   ```bash
   source /path/to/QuoteCLI/engine.sh
   ```

**That's it!** Now, every time you open a new terminal session, a fresh quote will brighten your day.

### ⭐ Tips and Tricks ✨

- Want to change the source of quotes? Modify the `quotes.txt` file within the QuoteCLI directory.
- Feeling particularly uninspired? Run `./quote.sh` anytime for an on-demand quote fix.

Enjoy your daily dose of inspiration with QuoteCLI, and feel free to reach out if you have any questions!
