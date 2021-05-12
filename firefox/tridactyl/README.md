Use the following command to load the config for tridactyl:

```:js let myConfig = JSON.parse(prompt('Paste the JSON string in the field below')); Object.keys(myConfig).forEach(key => tri.config.set(key, myConfig[key])); alert('Tridactyl settings saved!')```