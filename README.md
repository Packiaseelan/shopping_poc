# shopping_poc

Flutter project for Shopping POC.

## Getting Started

We are using Hex Flutter Core Library

```
  core:
    git:
      url: https://github.com/Packiaseelan/hex_f_core.git
      ref: *branchName
      path: core/app-mobile-core/src/

  widget_library:
    git:
      url: https://github.com/Packiaseelan/hex_f_core.git
      ref: *branchName
      path: widgets/app-mobile-widgets/src

  network_manager:
    git:
      url: https://github.com/Packiaseelan/hex_f_core.git
      ref: *branchName
      path: network_manager/app-mobile-networkmanager/src

  task_manager:
    git:
      url: https://github.com/Packiaseelan/hex_f_core.git
      ref: *branchName
      path: task_manager/app-mobile-taskmanager/src

```

To build this application, we need hex_f_core package in our local. And we need to use dependency_overrides: in pubspec.yaml

```
dependency_overrides:
  core:
    path: ../hex_f_core/core/app-mobile-core/src/

  widget_library:
    path: ../hex_f_core/widgets/app-mobile-widgets/src/

  network_manager:
    path: ../hex_f_core/network_manager/app-mobile-networkmanager/src/

  task_manager:
    path: ../hex_f_core/task_manager/app-mobile-taskmanager/src/
    
```

> If you are facing build issue, please check the dependency_overrides: path.

### It should be as like below.

    .
    ├── hex_f_core              # Hex Flutter Core Library
    └── shopping_poc            # Shopping App 
