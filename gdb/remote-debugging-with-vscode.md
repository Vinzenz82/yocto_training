# Remote Debugging with VSCode

## extensible SDK

### Preparation: basics
- example project to debug: https://github.com/Vinzenz82/bb-cmake-example/tree/main
- add the project as recipe inside the extensible SDK (see [extensible SDK](sdk-ext-usage/external_cmake_project.md))
- gdb and gdb-server is a part of the target image (see [gdb](gdb/compile-gdb-for-target.md))

### Preparation: VSCode 

#### Tasks to prepare Debugging

tasks.json:
```json
{
    "version": "2.0.0",
    "tasks": [{
        "label": "devtool_build",
        "options": {"cwd": "${env:HOME}/poky_sdk"},
        "command": "./layers/poky/scripts/devtool", 
        "args": ["build", "bb-cmake-example"],
        "type": "shell",
        "problemMatcher": []
    },
    {
        "label": "devtool_deploy",
        "options": {"cwd": "${env:HOME}/poky_sdk"},
        "command": "./layers/poky/scripts/devtool", 
        "args": ["deploy-target", "bb-cmake-example", "root@192.168.1.211" ],
        "type": "shell",
        "problemMatcher": []
    },
    {
        "label": "gdbserver_start",
        "command": "ssh", 
        "args": ["root@192.168.1.211", "'gdbserver --once localhost:1234 /usr/bin/HelloStaticWorld'" ],
        "type": "shell",
        "problemMatcher": [],
    },
    {
        "label": "Prepare Remote Debugging (build -> deploy -> start on target)",
        "dependsOn": ["devtool_build",
                      "devtool_deploy",
                      "gdbserver_start"],
        "dependsOrder": "sequence",
        "problemMatcher": [],
    }]
}
```

#### launch configuration

launch.json:
```json
  {
    "version": "0.2.0",
    "configurations": [{
      "name": "Remote",
      "type": "cppdbg",
      "request": "launch",
      "program": "${workspaceRoot}/oe-workdir/bb-cmake-example-1.0+git999/HelloStaticWorld", // for loading symbols from running program
      "cwd": "${workspaceFolder}",
  
      // pre launch tasks
      "preLaunchTask": "prelaunch", // The name of the task defined above

      // if you want to connect at entry point (requires remote program to start paused)
      "stopAtEntry": true,
      "stopAtConnect": false,
  
      "MIMode": "gdb",
      "miDebuggerPath": "/opt/poky/4.0.24/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gdb",
      "miDebuggerServerAddress": "192.168.1.211:1234",
      "setupCommands": [{
        "description": "Enable pretty-printing for gdb",
        "text": "-enable-pretty-printing",
        "ignoreFailures": true,
    }]
  }]
  }
```

