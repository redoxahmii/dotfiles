const fs = require("fs");

function parseConfFile(filePath) {
  const keybinds = [];
  const modifierReplacements = {
    $mainMod: "SUPER",
    $altMod: "ALT",
    $shiftMod: "SHIFT",
    $ctrlMod: "CONTROL",
    $rofiPath: "~/.config/rofi/",
    $srcPath: "~/.config/hypr/",
    $terminal: "Kitty",
    $fileManager: "Dolphin",
    $browser: "Firefox",
    $hyprshotDir: "~/Pictures/Screenshots/",
  };

  const lines = fs.readFileSync(filePath, "utf-8").split("\n");

  for (const line of lines) {
    const commentMatch = line.match(/#(.*)/);
    const comment = commentMatch ? commentMatch[1].trim() : null;
    const cleanLine = line.replace(/#.*/, "").trim();

    const bindMatch = cleanLine.match(
      /bind\s*=\s*([^,]+)\s*,\s*([^,]+)\s*,\s*([^,]+)(?:\s*,\s*([^,]*))?/,
    );

    if (bindMatch) {
      let [_, modifier, key, action, value = null] = bindMatch;

      // Replace variables in modifier
      modifier = modifier.trim();
      for (const [variable, replacement] of Object.entries(
        modifierReplacements,
      )) {
        if (modifier.includes(variable)) {
          modifier = modifier.replace(
            new RegExp(escapeRegExp(variable), "g"),
            replacement,
          );
        }
      }

      // Also check for variables in action and value
      action = action.trim();
      if (value) {
        value = value.trim();
        for (const [variable, replacement] of Object.entries(
          modifierReplacements,
        )) {
          if (value.includes(variable)) {
            value = value.replace(
              new RegExp(escapeRegExp(variable), "g"),
              replacement,
            );
          }
        }
      }

      keybinds.push({
        modifier,
        key: key.trim(),
        action,
        value,
        comment,
      });
    } else {
      console.warn(`Skipping invalid bind line: ${line}`);
    }
  }
  return { keybinds };
}

// Helper function to escape special characters in regex
function escapeRegExp(string) {
  return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function main() {
  const inputFilePath = "./keybinds.conf";
  const outputFilePath = "output.json";
  const result = parseConfFile(inputFilePath);
  fs.writeFileSync(outputFilePath, JSON.stringify(result, null, 2), "utf-8");
  console.log(`JSON output written to ${outputFilePath}`);
}

main();
