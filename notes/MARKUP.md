#

## Color Categories

### Light

Comment      : 78909C BlueGrey400       : ordinary comments
Debug        : D500F9 PurpleA400        : debugging, error checking
Delimiter    : 7E57C2 DeepPurple400     : braces, brackets, delimiters
EOF          : 303F9F Indigo400         : end of buffer/file styling
FixedValue   : 00B8D4 CyanA700          : booleans/NULL/stderr/symbols
IfElse       : FF6D00 OrangeA700        : if/else/switch
Include      : FF4081 PinkA200          : load libraries and modules
Loops        : FF6D00 OrangeA700        : for/while
Keyword      : 00A143 GreenA700 - 15val : words with special meanings
Method       : F9A825 Amber500 - 20val  : functions/method names
Number       : E53935 Red600            : numbers, ints, floats, hex codes
Preprocessor : 3F51B5 Indigo500         : c macros and defines
Special      : 0027BD LightBlue800      : special characters and char codes
String       : 039BE5 LightBlue600      : strings and ordinary chars
Title        : 2196F3 Blue500           : titles in text files
Type         : 00838F Teal800           : preset classes and types
Type2        : 0097A7 Teal700           : ...
Variable     : FF3D00 DeepOrangeA400    : not really sure

### Dark

Comment      : 78909C BlueGrey400            : ordinary comments
Debug        : D373E3 PurpleA100 - 10val     : debugging, error checking
Delimiter    : B39DDB DeepPurple200          : braces, brackets, delimiters
EOF          : 5C6BC0 Indigo400              : end of buffer/file styling
FixedValue   : 16E6E6 CyanA200 - 10val       : booleans/NULL/stderr/symbols
IfElse       : F29F24 Orange400 - 5val       : if/else/switch
Include      : E35D8A Pink300 - 5val         : load libraries and modules
Loops        : F29F24 Orange400 - 5val       : for/while
Keyword      : 00D96F GreenA400 - 5val       : words with special meanings
Method       : D9CC64 Yellow300 - 15val      : functions/method names
Number       : E34F4C Red400 - 5val          : numbers, ints, floats, hex codes
Preprocessor : 8596F2 IndigoA100  - 5val     : c macros and defines
Special      : 3AB0E6 LightBlueA200 - 10val  : special characters and char codes
String       : 73C2E6 LightBlueA100 - 10val  : strings and ordinary chars
Title        : 64B5F6 Blue300                : titles in text files
Type         : 00BFA5 TealA700               : preset classes and types
Type2        : 1BDBAB TealA400 - 5val        : ...
Variable     : D97C39 ~DeepOrange400 - 10val : not really sure


## Groups

| Main Group                  | Color Category          |
| --------------------------- | ----------------        |
| Boolean                     | FixedValue              |
| Comment                     | Comment                 |
| Character                   | String                  |
| Conditional                 | IfElse                  |
| Constant                    | FixedValue              |
| Debug                       | Debug                   |
| Define                      | Keyword                 |
| Delimiter                   | Delimiter               |
| Directory                   | Title                   |
| Exception                   | Debug                   |
| Float                       | Number                  |
| Function                    | Method                  |
| Identifier                  | Variable                |
| Include                     | Include                 |
| Keyword                     | Keyword                 |
| Label                       | Variable                |
| Macro                       | Preprocessor            |
| NonText                     | EOF                     |
| Number                      | Number                  |
| Operator                    | Method                  |
| PreCondit                   | Preprocessor            |
| PreProc                     | Preprocessor            |
| Repeat                      | Loops                   |
| Special                     | Special                 |
| SpecialChar                 | Special                 |
| SpecialComment              | Special                 |
| SpecialKey                  | Special                 |
| Statement                   | Keyword                 |
| StorageClass                | Type2                   |
| String                      | String                  |
| Structure                   | Type                    |
| Tag                         | Type2                   |
| Title                       | Title                   |
| Type                        | Type                    |
| TypeDef                     | Type2                   |

| Sub Group                   | Group Override          |
| --------------------------- | ----------------        |
| cssAttr                     |                         |
| cssBraces                   | Delimiter               |
| cssClassName                |                         |
| cssClassNameDot             |                         |
| cssColor                    | Number                  |
| cssFunction                 |                         |
| cssIdentifier               |                         |
| cssTagName                  |                         |
| gitCommitOverflow           |                         |
| gitCommitSummary            |                         |
| htmlArg                     | Keyword                 |
| htmlEndTag                  | Type                    |
| htmlTag                     | Type2                   |
| htmlTagName                 | Method                  |
| javaScriptBraces            | Delimiter               |
| javaScriptNumber            | Number                  |
| juliaTypedef                |                         |
| markdownCode                | E888A8 (Pink200 - 5val) |
| markdownUrl                 | String                  |
| markdownUrlTitle            | Special                 |
| pythonDecorator             |                         |
| pythonDecoratorName         |                         |
| NERDTreeDirSlash            | Normal                  |
| NERDTreeExecFile            | 69f0ae                  |
| rAssign                     |                         |
| rubyAttribute               |                         |
| rubyClass                   |                         |
| rubyConstant                |                         |
| rubyControl                 |                         |
| rubySymbol                  |                         |
| sassClass                   |                         |
| sassClassChar               |                         |
| sassControl                 |                         |
| sassDefault                 |                         |
| sassExtend                  |                         |
| sassFor                     | Repeat                  |
| sassFunctionDecl            |                         |
| sassMixin                   | Include                 |
| sassMixinName               | String                  |
| sassMixing                  | Include                 |
| sassPlaceholder             |                         |
| sassReturn                  |                         |
| sassWarn                    | Debug                   |
| shFunctionKey               | Keyword                 |
| shLoop                      | Loops                   |
| shShellVariables            |                         |
