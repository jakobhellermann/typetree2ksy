#![allow(clippy::redundant_closure_call)]
#![allow(clippy::needless_lifetimes)]
#![allow(clippy::match_single_binding)]
#![allow(clippy::clone_on_copy)]

#[doc = r" Error types."]
pub mod error {
    #[doc = r" Error from a `TryFrom` or `FromStr` implementation."]
    pub struct ConversionError(::std::borrow::Cow<'static, str>);
    impl ::std::error::Error for ConversionError {}
    impl ::std::fmt::Display for ConversionError {
        fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> Result<(), ::std::fmt::Error> {
            ::std::fmt::Display::fmt(&self.0, f)
        }
    }
    impl ::std::fmt::Debug for ConversionError {
        fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> Result<(), ::std::fmt::Error> {
            ::std::fmt::Debug::fmt(&self.0, f)
        }
    }
    impl From<&'static str> for ConversionError {
        fn from(value: &'static str) -> Self {
            Self(value.into())
        }
    }
    impl From<String> for ConversionError {
        fn from(value: String) -> Self {
            Self(value.into())
        }
    }
}
#[doc = "`AnyScalar`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"number\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"integer\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"null\""]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum AnyScalar {
    String(::std::string::String),
    Number(f64),
    Integer(i64),
    Boolean(bool),
    Null,
}
impl ::std::convert::From<&Self> for AnyScalar {
    fn from(value: &AnyScalar) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<f64> for AnyScalar {
    fn from(value: f64) -> Self {
        Self::Number(value)
    }
}
impl ::std::convert::From<i64> for AnyScalar {
    fn from(value: i64) -> Self {
        Self::Integer(value)
    }
}
impl ::std::convert::From<bool> for AnyScalar {
    fn from(value: bool) -> Self {
        Self::Boolean(value)
    }
}
#[doc = "`Attribute`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"properties\": {"]
#[doc = "    \"consume\": {"]
#[doc = "      \"description\": \"specify if terminator byte should be \\\"consumed\\\" when reading\\n\\nif true: the stream pointer will point to the byte after the terminator byte\\n\\nif false: the stream pointer will point to the terminator byte itself\\n\\ndefault is true\","]
#[doc = "      \"default\": true,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"contents\": {"]
#[doc = "      \"description\": \"specify fixed contents that the parser should encounter at this point. If the content of the stream doesn't match the given bytes, an error is thrown and it's meaningless to continue parsing\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/StringOrInteger\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"doc\": {"]
#[doc = "      \"$ref\": \"#/definitions/Doc\""]
#[doc = "    },"]
#[doc = "    \"doc-ref\": {"]
#[doc = "      \"$ref\": \"#/definitions/DocRef\""]
#[doc = "    },"]
#[doc = "    \"encoding\": {"]
#[doc = "      \"$ref\": \"#/definitions/CharacterEncoding\""]
#[doc = "    },"]
#[doc = "    \"enum\": {"]
#[doc = "      \"description\": \"name of existing enum field data type becomes given enum\","]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$\""]
#[doc = "    },"]
#[doc = "    \"eos-error\": {"]
#[doc = "      \"description\": \"allows the compiler to ignore the lack of a terminator if eos-error is disabled, string reading will stop at either:\\n\\n1. terminator being encountered\\n\\n2. end of stream is reached\\n\\ndefault is `true`\","]
#[doc = "      \"default\": true,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"id\": {"]
#[doc = "      \"description\": \"contains a string used to identify one attribute among others\","]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "    },"]
#[doc = "    \"if\": {"]
#[doc = "      \"description\": \"marks the attribute as optional (attribute is parsed only if the condition specified evaluates to `true`)\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"boolean\""]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"include\": {"]
#[doc = "      \"description\": \"specifies if terminator byte should be considered part of the string read and thus be appended to it\\n\\ndefault is false\","]
#[doc = "      \"default\": false,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"io\": {"]
#[doc = "      \"description\": \"specifies an IO stream from which a value should be parsed\","]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    \"pad-right\": {"]
#[doc = "      \"description\": \"specify a byte which is the string or byte array padded with after the end up to the total size\\n\\ncan be used only with `size` or `size-eos: true` (when the size is fixed)\\n\\nwhen `terminator`:\\n - isn't specified, then the `pad-right` controls where the string ends (basically acts like a terminator)\\n - is specified, padding comes after the terminator, not before. The value is terminated immediately after the terminator occurs, so the `pad-right` has no effect on parsing and is only relevant for serialization\","]
#[doc = "      \"type\": \"integer\","]
#[doc = "      \"maximum\": 255.0,"]
#[doc = "      \"minimum\": 0.0"]
#[doc = "    },"]
#[doc = "    \"pos\": {"]
#[doc = "      \"description\": \"specifies position at which the value should be parsed\","]
#[doc = "      \"$ref\": \"#/definitions/StringOrInteger\""]
#[doc = "    },"]
#[doc = "    \"process\": {"]
#[doc = "      \"description\": \"specifies an algorithm to be applied to the underlying byte buffer of the attribute before parsing\\n\\ncan be used only if the size is known (either `size`, `size-eos: true` or `terminator` are specified), see [Applying `process` without a size](https://doc.kaitai.io/user_guide.html#_applying_process_without_a_size) in the User Guide\\n\\n| Value | Description\\n|-\\n| `xor(key)` | <p>apply a bitwise XOR (written as `^` in most C-like languages) to every byte of the buffer using the provided `key`</p><p>**`key`** is required, and can be either <ul><li>a single byte value — will be XORed with every byte of the input stream <ul><li>make sure that the **`key`** is in range **0-255**, otherwise you may get unexpected results</li></ul></li><li>a byte array — first byte of the input will be XORed with the first byte of the key, second byte of the input with the second byte of the key, etc. <ul><li>when the end of the key is reached, it starts again from the first byte</li></ul></li></ul></p><p>_the output length remains the same as the input length_</p>\\n| `rol(n)`, `ror(n)` | <p>apply a [bitwise rotation](https://en.wikipedia.org/wiki/Bitwise_operation#bit_rotation) (also known as a [circular shift](https://en.wikipedia.org/wiki/Circular_shift)) by **`n`** bits to every byte of the buffer</p><p>`rol` = left circular shift, `ror` = right circular shift</p><p>**`n`** is required, and should be in range **0-7** for consistent results (to be safe, use `shift_amount % 8` as the **`n`** parameter, if the value of `shift_amount` itself may not fall into that range)</p>\\n| `zlib` | <p>apply a _zlib_ decompression to the input buffer, expecting it to be a full-fledged _zlib_ stream, i.e. having a regular 2-byte _zlib_ header.</p><p>typical _zlib_ header values: <ul><li>`78 01` — low compression</li><li>`78 9C` — default compression</li><li>`78 DA` — best compression</li></ul></p>\\n| <p>`{my_custom_processor}(a, b, ...)`</p><p><i>(`{my_custom_processor}` is an arbitrary name matching `[a-z][a-z0-9_.]*`)</i></p> | <p>use a custom processing routine, which you implement in imperative code in the target language</p><p>the generated code will use the class name `{my_custom_processor}` using the naming convention of the target language (in most languages `MyCustomProcessor`, but e.g. `my_custom_processor_t` in C++: check the generated code)</p><p>the processing class **must** define the method `public byte[] decode(byte[] src)` and should implement the interface `CustomDecoder` (available in [C++](https://github.com/kaitai-io/kaitai_struct_cpp_stl_runtime/blob/d020781b96ea1e2fe7e0ecf47ff3ae3c829ccd31/kaitai/custom_decoder.h#L8-L12), [C#](https://github.com/kaitai-io/kaitai_struct_csharp_runtime/blob/1b66a9a85f39c52728893400a23504844cc78e34/KaitaiStruct.cs#L24-L37) and [Java](https://github.com/kaitai-io/kaitai_struct_java_runtime/blob/c342c6e836ddba03c9ec33a59034e209bb04a976/src/main/java/io/kaitai/struct/CustomDecoder.java#L26-L39))</p><p>you can pass any parameters `(a, b, ...)` to your `{my_custom_processor}` class constructor (**omit** the `()` brackets for parameter-less invocation)</p><p></p><p>one can reference a class in a different namespace/package like `com.example.my_rle(5, 3)`</p><p><i>see [Custom processing routines](https://doc.kaitai.io/user_guide.html#custom-process) in the User Guide for more info</i></p>\","]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^zlib|(xor|rol|ror)\\\\(.*\\\\)$\""]
#[doc = "    },"]
#[doc = "    \"repeat\": {"]
#[doc = "      \"description\": \"designates repeated attribute in a structure\\n\\n| Value     | Description\\n|-\\n| `eos`     | repeat until the end of the current stream\\n| `expr`    | repeat as many times as specified in `repeat-expr`\\n| `until`   | repeat until the expression in `repeat-until` becomes **`true`**\\n\\nattribute read as array/list/sequence\","]
#[doc = "      \"enum\": ["]
#[doc = "        \"expr\","]
#[doc = "        \"eos\","]
#[doc = "        \"until\""]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"repeat-expr\": {"]
#[doc = "      \"description\": \"specify number of repetitions for repeated attribute\","]
#[doc = "      \"$ref\": \"#/definitions/StringOrInteger\""]
#[doc = "    },"]
#[doc = "    \"repeat-until\": {"]
#[doc = "      \"description\": \"specifies a condition to be checked **after** each parsed item, repeating while the expression is `false`\\n\\none can use `_` in the expression, which is a special **local** variable that references the last read element\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"boolean\""]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"size\": {"]
#[doc = "      \"description\": \"the number of bytes to read if `type` isn't defined.\\n\\ncan also be an expression\","]
#[doc = "      \"$ref\": \"#/definitions/StringOrInteger\""]
#[doc = "    },"]
#[doc = "    \"size-eos\": {"]
#[doc = "      \"description\": \"if `true`, reads all the bytes till the end of the stream\\n\\ndefault is `false`\","]
#[doc = "      \"default\": false,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"terminator\": {"]
#[doc = "      \"description\": \"string or byte array reading will stop when it encounters this byte\\n\\ncannot be used with `type: strz` (which already implies `terminator: 0` - null-terminated string)\","]
#[doc = "      \"type\": \"integer\","]
#[doc = "      \"maximum\": 255.0,"]
#[doc = "      \"minimum\": 0.0"]
#[doc = "    },"]
#[doc = "    \"type\": {"]
#[doc = "      \"description\": \"defines data type for an attribute\\n\\nthe type can also be user-defined in the `types` key\\n\\none can reference a nested user-defined type by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_type`)\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/TypeRef\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"object\","]
#[doc = "          \"required\": ["]
#[doc = "            \"cases\","]
#[doc = "            \"switch-on\""]
#[doc = "          ],"]
#[doc = "          \"properties\": {"]
#[doc = "            \"cases\": {"]
#[doc = "              \"type\": \"object\","]
#[doc = "              \"patternProperties\": {"]
#[doc = "                \"^.*$\": {"]
#[doc = "                  \"$ref\": \"#/definitions/TypeRef\""]
#[doc = "                }"]
#[doc = "              },"]
#[doc = "              \"additionalProperties\": false"]
#[doc = "            },"]
#[doc = "            \"switch-on\": {"]
#[doc = "              \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "            }"]
#[doc = "          },"]
#[doc = "          \"patternProperties\": {"]
#[doc = "            \"^-\": true"]
#[doc = "          },"]
#[doc = "          \"additionalProperties\": false"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"valid\": {"]
#[doc = "      \"description\": \"validation constraints that the actual value of the attribute must satisfy, otherwise a subclass of `ValidationFailedError` will be raised\","]
#[doc = "      \"$ref\": \"#/definitions/ValidationSpec\""]
#[doc = "    },"]
#[doc = "    \"value\": {"]
#[doc = "      \"description\": \"overrides any reading & parsing. Instead, just calculates function specified in value and returns the result as this instance. Has many purposes\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct Attribute {
    #[doc = "specify if terminator byte should be \"consumed\" when reading\n\nif true: the stream pointer will point to the byte after the terminator byte\n\nif false: the stream pointer will point to the terminator byte itself\n\ndefault is true"]
    #[serde(
        default = "defaults::default_bool::<true>",
        skip_serializing_if = "defaults::is_bool::<true>"
    )]
    pub consume: bool,
    #[doc = "specify fixed contents that the parser should encounter at this point. If the content of the stream doesn't match the given bytes, an error is thrown and it's meaningless to continue parsing"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub contents: ::std::option::Option<AttributeContents>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub doc: ::std::option::Option<Doc>,
    #[serde(
        rename = "doc-ref",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub doc_ref: ::std::option::Option<DocRef>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub encoding: ::std::option::Option<CharacterEncoding>,
    #[doc = "name of existing enum field data type becomes given enum"]
    #[serde(
        rename = "enum",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub enum_: ::std::option::Option<AttributeEnum>,
    #[doc = "allows the compiler to ignore the lack of a terminator if eos-error is disabled, string reading will stop at either:\n\n1. terminator being encountered\n\n2. end of stream is reached\n\ndefault is `true`"]
    #[serde(
        rename = "eos-error",
        default = "defaults::default_bool::<true>",
        skip_serializing_if = "defaults::is_bool::<true>"
    )]
    pub eos_error: bool,
    #[doc = "contains a string used to identify one attribute among others"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub id: ::std::option::Option<AttributeId>,
    #[doc = "marks the attribute as optional (attribute is parsed only if the condition specified evaluates to `true`)"]
    #[serde(
        rename = "if",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub if_: ::std::option::Option<AttributeIf>,
    #[doc = "specifies if terminator byte should be considered part of the string read and thus be appended to it\n\ndefault is false"]
    #[serde(
        default = "defaults::default_bool::<false>",
        skip_serializing_if = "defaults::is_bool::<false>"
    )]
    pub include: bool,
    #[doc = "specifies an IO stream from which a value should be parsed"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub io: ::std::option::Option<::std::string::String>,
    #[doc = "specify a byte which is the string or byte array padded with after the end up to the total size\n\ncan be used only with `size` or `size-eos: true` (when the size is fixed)\n\nwhen `terminator`:\n - isn't specified, then the `pad-right` controls where the string ends (basically acts like a terminator)\n - is specified, padding comes after the terminator, not before. The value is terminated immediately after the terminator occurs, so the `pad-right` has no effect on parsing and is only relevant for serialization"]
    #[serde(
        rename = "pad-right",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub pad_right: ::std::option::Option<u8>,
    #[doc = "specifies position at which the value should be parsed"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub pos: ::std::option::Option<StringOrInteger>,
    #[doc = "specifies an algorithm to be applied to the underlying byte buffer of the attribute before parsing\n\ncan be used only if the size is known (either `size`, `size-eos: true` or `terminator` are specified), see [Applying `process` without a size](https://doc.kaitai.io/user_guide.html#_applying_process_without_a_size) in the User Guide\n\n| Value | Description\n|-\n| `xor(key)` | <p>apply a bitwise XOR (written as `^` in most C-like languages) to every byte of the buffer using the provided `key`</p><p>**`key`** is required, and can be either <ul><li>a single byte value — will be XORed with every byte of the input stream <ul><li>make sure that the **`key`** is in range **0-255**, otherwise you may get unexpected results</li></ul></li><li>a byte array — first byte of the input will be XORed with the first byte of the key, second byte of the input with the second byte of the key, etc. <ul><li>when the end of the key is reached, it starts again from the first byte</li></ul></li></ul></p><p>_the output length remains the same as the input length_</p>\n| `rol(n)`, `ror(n)` | <p>apply a [bitwise rotation](https://en.wikipedia.org/wiki/Bitwise_operation#bit_rotation) (also known as a [circular shift](https://en.wikipedia.org/wiki/Circular_shift)) by **`n`** bits to every byte of the buffer</p><p>`rol` = left circular shift, `ror` = right circular shift</p><p>**`n`** is required, and should be in range **0-7** for consistent results (to be safe, use `shift_amount % 8` as the **`n`** parameter, if the value of `shift_amount` itself may not fall into that range)</p>\n| `zlib` | <p>apply a _zlib_ decompression to the input buffer, expecting it to be a full-fledged _zlib_ stream, i.e. having a regular 2-byte _zlib_ header.</p><p>typical _zlib_ header values: <ul><li>`78 01` — low compression</li><li>`78 9C` — default compression</li><li>`78 DA` — best compression</li></ul></p>\n| <p>`{my_custom_processor}(a, b, ...)`</p><p><i>(`{my_custom_processor}` is an arbitrary name matching `[a-z][a-z0-9_.]*`)</i></p> | <p>use a custom processing routine, which you implement in imperative code in the target language</p><p>the generated code will use the class name `{my_custom_processor}` using the naming convention of the target language (in most languages `MyCustomProcessor`, but e.g. `my_custom_processor_t` in C++: check the generated code)</p><p>the processing class **must** define the method `public byte[] decode(byte[] src)` and should implement the interface `CustomDecoder` (available in [C++](https://github.com/kaitai-io/kaitai_struct_cpp_stl_runtime/blob/d020781b96ea1e2fe7e0ecf47ff3ae3c829ccd31/kaitai/custom_decoder.h#L8-L12), [C#](https://github.com/kaitai-io/kaitai_struct_csharp_runtime/blob/1b66a9a85f39c52728893400a23504844cc78e34/KaitaiStruct.cs#L24-L37) and [Java](https://github.com/kaitai-io/kaitai_struct_java_runtime/blob/c342c6e836ddba03c9ec33a59034e209bb04a976/src/main/java/io/kaitai/struct/CustomDecoder.java#L26-L39))</p><p>you can pass any parameters `(a, b, ...)` to your `{my_custom_processor}` class constructor (**omit** the `()` brackets for parameter-less invocation)</p><p></p><p>one can reference a class in a different namespace/package like `com.example.my_rle(5, 3)`</p><p><i>see [Custom processing routines](https://doc.kaitai.io/user_guide.html#custom-process) in the User Guide for more info</i></p>"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub process: ::std::option::Option<AttributeProcess>,
    #[doc = "designates repeated attribute in a structure\n\n| Value     | Description\n|-\n| `eos`     | repeat until the end of the current stream\n| `expr`    | repeat as many times as specified in `repeat-expr`\n| `until`   | repeat until the expression in `repeat-until` becomes **`true`**\n\nattribute read as array/list/sequence"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub repeat: ::std::option::Option<AttributeRepeat>,
    #[doc = "specify number of repetitions for repeated attribute"]
    #[serde(
        rename = "repeat-expr",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub repeat_expr: ::std::option::Option<StringOrInteger>,
    #[doc = "specifies a condition to be checked **after** each parsed item, repeating while the expression is `false`\n\none can use `_` in the expression, which is a special **local** variable that references the last read element"]
    #[serde(
        rename = "repeat-until",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub repeat_until: ::std::option::Option<AttributeRepeatUntil>,
    #[doc = "the number of bytes to read if `type` isn't defined.\n\ncan also be an expression"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub size: ::std::option::Option<StringOrInteger>,
    #[doc = "if `true`, reads all the bytes till the end of the stream\n\ndefault is `false`"]
    #[serde(
        rename = "size-eos",
        default = "defaults::default_bool::<false>",
        skip_serializing_if = "defaults::is_bool::<false>"
    )]
    pub size_eos: bool,
    #[doc = "string or byte array reading will stop when it encounters this byte\n\ncannot be used with `type: strz` (which already implies `terminator: 0` - null-terminated string)"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub terminator: ::std::option::Option<u8>,
    #[doc = "defines data type for an attribute\n\nthe type can also be user-defined in the `types` key\n\none can reference a nested user-defined type by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_type`)"]
    #[serde(
        rename = "type",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub type_: ::std::option::Option<AttributeType>,
    #[doc = "validation constraints that the actual value of the attribute must satisfy, otherwise a subclass of `ValidationFailedError` will be raised"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub valid: ::std::option::Option<ValidationSpec>,
    #[doc = "overrides any reading & parsing. Instead, just calculates function specified in value and returns the result as this instance. Has many purposes"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub value: ::std::option::Option<::serde_json::Value>,
}
impl ::std::convert::From<&Attribute> for Attribute {
    fn from(value: &Attribute) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for Attribute {
    fn default() -> Self {
        Self {
            consume: defaults::default_bool::<true>(),
            contents: Default::default(),
            doc: Default::default(),
            doc_ref: Default::default(),
            encoding: Default::default(),
            enum_: Default::default(),
            eos_error: defaults::default_bool::<true>(),
            id: Default::default(),
            if_: Default::default(),
            include: defaults::default_bool::<false>(),
            io: Default::default(),
            pad_right: Default::default(),
            pos: Default::default(),
            process: Default::default(),
            repeat: Default::default(),
            repeat_expr: Default::default(),
            repeat_until: Default::default(),
            size: Default::default(),
            size_eos: defaults::default_bool::<false>(),
            terminator: Default::default(),
            type_: Default::default(),
            valid: Default::default(),
            value: Default::default(),
        }
    }
}
#[doc = "specify fixed contents that the parser should encounter at this point. If the content of the stream doesn't match the given bytes, an error is thrown and it's meaningless to continue parsing"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"specify fixed contents that the parser should encounter at this point. If the content of the stream doesn't match the given bytes, an error is thrown and it's meaningless to continue parsing\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/StringOrInteger\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum AttributeContents {
    String(::std::string::String),
    Array(::std::vec::Vec<StringOrInteger>),
}
impl ::std::convert::From<&Self> for AttributeContents {
    fn from(value: &AttributeContents) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<StringOrInteger>> for AttributeContents {
    fn from(value: ::std::vec::Vec<StringOrInteger>) -> Self {
        Self::Array(value)
    }
}
#[doc = "name of existing enum field data type becomes given enum"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"name of existing enum field data type becomes given enum\","]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct AttributeEnum(::std::string::String);
impl ::std::ops::Deref for AttributeEnum {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<AttributeEnum> for ::std::string::String {
    fn from(value: AttributeEnum) -> Self {
        value.0
    }
}
impl ::std::convert::From<&AttributeEnum> for AttributeEnum {
    fn from(value: &AttributeEnum) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for AttributeEnum {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for AttributeEnum {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for AttributeEnum {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for AttributeEnum {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for AttributeEnum {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "contains a string used to identify one attribute among others"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"contains a string used to identify one attribute among others\","]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct AttributeId(::std::string::String);
impl ::std::ops::Deref for AttributeId {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<AttributeId> for ::std::string::String {
    fn from(value: AttributeId) -> Self {
        value.0
    }
}
impl ::std::convert::From<&AttributeId> for AttributeId {
    fn from(value: &AttributeId) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for AttributeId {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^[a-z][a-z0-9_]*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for AttributeId {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for AttributeId {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for AttributeId {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for AttributeId {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "marks the attribute as optional (attribute is parsed only if the condition specified evaluates to `true`)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"marks the attribute as optional (attribute is parsed only if the condition specified evaluates to `true`)\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum AttributeIf {
    String(::std::string::String),
    Boolean(bool),
}
impl ::std::convert::From<&Self> for AttributeIf {
    fn from(value: &AttributeIf) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for AttributeIf {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::String(x) => x.fmt(f),
            Self::Boolean(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<bool> for AttributeIf {
    fn from(value: bool) -> Self {
        Self::Boolean(value)
    }
}
#[doc = "specifies an algorithm to be applied to the underlying byte buffer of the attribute before parsing\n\ncan be used only if the size is known (either `size`, `size-eos: true` or `terminator` are specified), see [Applying `process` without a size](https://doc.kaitai.io/user_guide.html#_applying_process_without_a_size) in the User Guide\n\n| Value | Description\n|-\n| `xor(key)` | <p>apply a bitwise XOR (written as `^` in most C-like languages) to every byte of the buffer using the provided `key`</p><p>**`key`** is required, and can be either <ul><li>a single byte value — will be XORed with every byte of the input stream <ul><li>make sure that the **`key`** is in range **0-255**, otherwise you may get unexpected results</li></ul></li><li>a byte array — first byte of the input will be XORed with the first byte of the key, second byte of the input with the second byte of the key, etc. <ul><li>when the end of the key is reached, it starts again from the first byte</li></ul></li></ul></p><p>_the output length remains the same as the input length_</p>\n| `rol(n)`, `ror(n)` | <p>apply a [bitwise rotation](https://en.wikipedia.org/wiki/Bitwise_operation#bit_rotation) (also known as a [circular shift](https://en.wikipedia.org/wiki/Circular_shift)) by **`n`** bits to every byte of the buffer</p><p>`rol` = left circular shift, `ror` = right circular shift</p><p>**`n`** is required, and should be in range **0-7** for consistent results (to be safe, use `shift_amount % 8` as the **`n`** parameter, if the value of `shift_amount` itself may not fall into that range)</p>\n| `zlib` | <p>apply a _zlib_ decompression to the input buffer, expecting it to be a full-fledged _zlib_ stream, i.e. having a regular 2-byte _zlib_ header.</p><p>typical _zlib_ header values: <ul><li>`78 01` — low compression</li><li>`78 9C` — default compression</li><li>`78 DA` — best compression</li></ul></p>\n| <p>`{my_custom_processor}(a, b, ...)`</p><p><i>(`{my_custom_processor}` is an arbitrary name matching `[a-z][a-z0-9_.]*`)</i></p> | <p>use a custom processing routine, which you implement in imperative code in the target language</p><p>the generated code will use the class name `{my_custom_processor}` using the naming convention of the target language (in most languages `MyCustomProcessor`, but e.g. `my_custom_processor_t` in C++: check the generated code)</p><p>the processing class **must** define the method `public byte[] decode(byte[] src)` and should implement the interface `CustomDecoder` (available in [C++](https://github.com/kaitai-io/kaitai_struct_cpp_stl_runtime/blob/d020781b96ea1e2fe7e0ecf47ff3ae3c829ccd31/kaitai/custom_decoder.h#L8-L12), [C#](https://github.com/kaitai-io/kaitai_struct_csharp_runtime/blob/1b66a9a85f39c52728893400a23504844cc78e34/KaitaiStruct.cs#L24-L37) and [Java](https://github.com/kaitai-io/kaitai_struct_java_runtime/blob/c342c6e836ddba03c9ec33a59034e209bb04a976/src/main/java/io/kaitai/struct/CustomDecoder.java#L26-L39))</p><p>you can pass any parameters `(a, b, ...)` to your `{my_custom_processor}` class constructor (**omit** the `()` brackets for parameter-less invocation)</p><p></p><p>one can reference a class in a different namespace/package like `com.example.my_rle(5, 3)`</p><p><i>see [Custom processing routines](https://doc.kaitai.io/user_guide.html#custom-process) in the User Guide for more info</i></p>"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"specifies an algorithm to be applied to the underlying byte buffer of the attribute before parsing\\n\\ncan be used only if the size is known (either `size`, `size-eos: true` or `terminator` are specified), see [Applying `process` without a size](https://doc.kaitai.io/user_guide.html#_applying_process_without_a_size) in the User Guide\\n\\n| Value | Description\\n|-\\n| `xor(key)` | <p>apply a bitwise XOR (written as `^` in most C-like languages) to every byte of the buffer using the provided `key`</p><p>**`key`** is required, and can be either <ul><li>a single byte value — will be XORed with every byte of the input stream <ul><li>make sure that the **`key`** is in range **0-255**, otherwise you may get unexpected results</li></ul></li><li>a byte array — first byte of the input will be XORed with the first byte of the key, second byte of the input with the second byte of the key, etc. <ul><li>when the end of the key is reached, it starts again from the first byte</li></ul></li></ul></p><p>_the output length remains the same as the input length_</p>\\n| `rol(n)`, `ror(n)` | <p>apply a [bitwise rotation](https://en.wikipedia.org/wiki/Bitwise_operation#bit_rotation) (also known as a [circular shift](https://en.wikipedia.org/wiki/Circular_shift)) by **`n`** bits to every byte of the buffer</p><p>`rol` = left circular shift, `ror` = right circular shift</p><p>**`n`** is required, and should be in range **0-7** for consistent results (to be safe, use `shift_amount % 8` as the **`n`** parameter, if the value of `shift_amount` itself may not fall into that range)</p>\\n| `zlib` | <p>apply a _zlib_ decompression to the input buffer, expecting it to be a full-fledged _zlib_ stream, i.e. having a regular 2-byte _zlib_ header.</p><p>typical _zlib_ header values: <ul><li>`78 01` — low compression</li><li>`78 9C` — default compression</li><li>`78 DA` — best compression</li></ul></p>\\n| <p>`{my_custom_processor}(a, b, ...)`</p><p><i>(`{my_custom_processor}` is an arbitrary name matching `[a-z][a-z0-9_.]*`)</i></p> | <p>use a custom processing routine, which you implement in imperative code in the target language</p><p>the generated code will use the class name `{my_custom_processor}` using the naming convention of the target language (in most languages `MyCustomProcessor`, but e.g. `my_custom_processor_t` in C++: check the generated code)</p><p>the processing class **must** define the method `public byte[] decode(byte[] src)` and should implement the interface `CustomDecoder` (available in [C++](https://github.com/kaitai-io/kaitai_struct_cpp_stl_runtime/blob/d020781b96ea1e2fe7e0ecf47ff3ae3c829ccd31/kaitai/custom_decoder.h#L8-L12), [C#](https://github.com/kaitai-io/kaitai_struct_csharp_runtime/blob/1b66a9a85f39c52728893400a23504844cc78e34/KaitaiStruct.cs#L24-L37) and [Java](https://github.com/kaitai-io/kaitai_struct_java_runtime/blob/c342c6e836ddba03c9ec33a59034e209bb04a976/src/main/java/io/kaitai/struct/CustomDecoder.java#L26-L39))</p><p>you can pass any parameters `(a, b, ...)` to your `{my_custom_processor}` class constructor (**omit** the `()` brackets for parameter-less invocation)</p><p></p><p>one can reference a class in a different namespace/package like `com.example.my_rle(5, 3)`</p><p><i>see [Custom processing routines](https://doc.kaitai.io/user_guide.html#custom-process) in the User Guide for more info</i></p>\","]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^zlib|(xor|rol|ror)\\\\(.*\\\\)$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct AttributeProcess(::std::string::String);
impl ::std::ops::Deref for AttributeProcess {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<AttributeProcess> for ::std::string::String {
    fn from(value: AttributeProcess) -> Self {
        value.0
    }
}
impl ::std::convert::From<&AttributeProcess> for AttributeProcess {
    fn from(value: &AttributeProcess) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for AttributeProcess {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^zlib|(xor|rol|ror)\\(.*\\)$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^zlib|(xor|rol|ror)\\(.*\\)$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for AttributeProcess {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for AttributeProcess {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for AttributeProcess {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for AttributeProcess {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "designates repeated attribute in a structure\n\n| Value     | Description\n|-\n| `eos`     | repeat until the end of the current stream\n| `expr`    | repeat as many times as specified in `repeat-expr`\n| `until`   | repeat until the expression in `repeat-until` becomes **`true`**\n\nattribute read as array/list/sequence"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"designates repeated attribute in a structure\\n\\n| Value     | Description\\n|-\\n| `eos`     | repeat until the end of the current stream\\n| `expr`    | repeat as many times as specified in `repeat-expr`\\n| `until`   | repeat until the expression in `repeat-until` becomes **`true`**\\n\\nattribute read as array/list/sequence\","]
#[doc = "  \"enum\": ["]
#[doc = "    \"expr\","]
#[doc = "    \"eos\","]
#[doc = "    \"until\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum AttributeRepeat {
    #[serde(rename = "expr")]
    Expr,
    #[serde(rename = "eos")]
    Eos,
    #[serde(rename = "until")]
    Until,
}
impl ::std::convert::From<&Self> for AttributeRepeat {
    fn from(value: &AttributeRepeat) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for AttributeRepeat {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Expr => f.write_str("expr"),
            Self::Eos => f.write_str("eos"),
            Self::Until => f.write_str("until"),
        }
    }
}
impl ::std::str::FromStr for AttributeRepeat {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "expr" => Ok(Self::Expr),
            "eos" => Ok(Self::Eos),
            "until" => Ok(Self::Until),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for AttributeRepeat {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for AttributeRepeat {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for AttributeRepeat {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
#[doc = "specifies a condition to be checked **after** each parsed item, repeating while the expression is `false`\n\none can use `_` in the expression, which is a special **local** variable that references the last read element"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"specifies a condition to be checked **after** each parsed item, repeating while the expression is `false`\\n\\none can use `_` in the expression, which is a special **local** variable that references the last read element\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum AttributeRepeatUntil {
    String(::std::string::String),
    Boolean(bool),
}
impl ::std::convert::From<&Self> for AttributeRepeatUntil {
    fn from(value: &AttributeRepeatUntil) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for AttributeRepeatUntil {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::String(x) => x.fmt(f),
            Self::Boolean(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<bool> for AttributeRepeatUntil {
    fn from(value: bool) -> Self {
        Self::Boolean(value)
    }
}
#[doc = "defines data type for an attribute\n\nthe type can also be user-defined in the `types` key\n\none can reference a nested user-defined type by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_type`)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"defines data type for an attribute\\n\\nthe type can also be user-defined in the `types` key\\n\\none can reference a nested user-defined type by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_type`)\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/TypeRef\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"cases\","]
#[doc = "        \"switch-on\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"cases\": {"]
#[doc = "          \"type\": \"object\","]
#[doc = "          \"patternProperties\": {"]
#[doc = "            \"^.*$\": {"]
#[doc = "              \"$ref\": \"#/definitions/TypeRef\""]
#[doc = "            }"]
#[doc = "          },"]
#[doc = "          \"additionalProperties\": false"]
#[doc = "        },"]
#[doc = "        \"switch-on\": {"]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged, deny_unknown_fields)]
pub enum AttributeType {
    TypeRef(TypeRef),
    Object {
        cases: indexmap::IndexMap<AttributeTypeObjectCasesKey, TypeRef>,
        #[serde(rename = "switch-on")]
        switch_on: AnyScalar,
    },
}
impl ::std::convert::From<&Self> for AttributeType {
    fn from(value: &AttributeType) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<TypeRef> for AttributeType {
    fn from(value: TypeRef) -> Self {
        Self::TypeRef(value)
    }
}
#[doc = "`AttributeTypeObjectCasesKey`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^.*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct AttributeTypeObjectCasesKey(::std::string::String);
impl ::std::ops::Deref for AttributeTypeObjectCasesKey {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<AttributeTypeObjectCasesKey> for ::std::string::String {
    fn from(value: AttributeTypeObjectCasesKey) -> Self {
        value.0
    }
}
impl ::std::convert::From<&AttributeTypeObjectCasesKey> for AttributeTypeObjectCasesKey {
    fn from(value: &AttributeTypeObjectCasesKey) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for AttributeTypeObjectCasesKey {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^.*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^.*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for AttributeTypeObjectCasesKey {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for AttributeTypeObjectCasesKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for AttributeTypeObjectCasesKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for AttributeTypeObjectCasesKey {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`Attributes`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"array\","]
#[doc = "  \"items\": {"]
#[doc = "    \"$ref\": \"#/definitions/Attribute\""]
#[doc = "  }"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(transparent)]
pub struct Attributes(pub ::std::vec::Vec<Attribute>);
impl ::std::ops::Deref for Attributes {
    type Target = ::std::vec::Vec<Attribute>;
    fn deref(&self) -> &::std::vec::Vec<Attribute> {
        &self.0
    }
}
impl ::std::convert::From<Attributes> for ::std::vec::Vec<Attribute> {
    fn from(value: Attributes) -> Self {
        value.0
    }
}
impl ::std::convert::From<&Attributes> for Attributes {
    fn from(value: &Attributes) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<Attribute>> for Attributes {
    fn from(value: ::std::vec::Vec<Attribute>) -> Self {
        Self(value)
    }
}
#[doc = "canonical names of character encodings supported by Kaitai Struct\n\nin addition to these canonical names, the compiler (since version 0.11) also recognizes their popular aliases, but issues a warning for them"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"canonical names of character encodings supported by Kaitai Struct\\n\\nin addition to these canonical names, the compiler (since version 0.11) also recognizes their popular aliases, but issues a warning for them\","]
#[doc = "  \"enum\": ["]
#[doc = "    \"ASCII\","]
#[doc = "    \"UTF-8\","]
#[doc = "    \"UTF-16BE\","]
#[doc = "    \"UTF-16LE\","]
#[doc = "    \"UTF-32BE\","]
#[doc = "    \"UTF-32LE\","]
#[doc = "    \"ISO-8859-1\","]
#[doc = "    \"ISO-8859-2\","]
#[doc = "    \"ISO-8859-3\","]
#[doc = "    \"ISO-8859-4\","]
#[doc = "    \"ISO-8859-5\","]
#[doc = "    \"ISO-8859-6\","]
#[doc = "    \"ISO-8859-7\","]
#[doc = "    \"ISO-8859-8\","]
#[doc = "    \"ISO-8859-9\","]
#[doc = "    \"ISO-8859-10\","]
#[doc = "    \"ISO-8859-11\","]
#[doc = "    \"ISO-8859-13\","]
#[doc = "    \"ISO-8859-14\","]
#[doc = "    \"ISO-8859-15\","]
#[doc = "    \"ISO-8859-16\","]
#[doc = "    \"windows-1250\","]
#[doc = "    \"windows-1251\","]
#[doc = "    \"windows-1252\","]
#[doc = "    \"windows-1253\","]
#[doc = "    \"windows-1254\","]
#[doc = "    \"windows-1255\","]
#[doc = "    \"windows-1256\","]
#[doc = "    \"windows-1257\","]
#[doc = "    \"windows-1258\","]
#[doc = "    \"IBM437\","]
#[doc = "    \"IBM866\","]
#[doc = "    \"Shift_JIS\","]
#[doc = "    \"Big5\","]
#[doc = "    \"EUC-KR\""]
#[doc = "  ],"]
#[doc = "  \"$comment\": \"the `enum` list must be kept in sync with https://github.com/kaitai-io/kaitai_struct_compiler/blob/master/shared/src/main/scala/io/kaitai/struct/EncodingList.scala - the CI workflow [`check.yml`](https://github.com/kaitai-io/ksy_schema/blob/master/.github/workflows/check.yml) checks this\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum CharacterEncoding {
    #[serde(rename = "ASCII")]
    Ascii,
    #[serde(rename = "UTF-8")]
    Utf8,
    #[serde(rename = "UTF-16BE")]
    Utf16be,
    #[serde(rename = "UTF-16LE")]
    Utf16le,
    #[serde(rename = "UTF-32BE")]
    Utf32be,
    #[serde(rename = "UTF-32LE")]
    Utf32le,
    #[serde(rename = "ISO-8859-1")]
    Iso88591,
    #[serde(rename = "ISO-8859-2")]
    Iso88592,
    #[serde(rename = "ISO-8859-3")]
    Iso88593,
    #[serde(rename = "ISO-8859-4")]
    Iso88594,
    #[serde(rename = "ISO-8859-5")]
    Iso88595,
    #[serde(rename = "ISO-8859-6")]
    Iso88596,
    #[serde(rename = "ISO-8859-7")]
    Iso88597,
    #[serde(rename = "ISO-8859-8")]
    Iso88598,
    #[serde(rename = "ISO-8859-9")]
    Iso88599,
    #[serde(rename = "ISO-8859-10")]
    Iso885910,
    #[serde(rename = "ISO-8859-11")]
    Iso885911,
    #[serde(rename = "ISO-8859-13")]
    Iso885913,
    #[serde(rename = "ISO-8859-14")]
    Iso885914,
    #[serde(rename = "ISO-8859-15")]
    Iso885915,
    #[serde(rename = "ISO-8859-16")]
    Iso885916,
    #[serde(rename = "windows-1250")]
    Windows1250,
    #[serde(rename = "windows-1251")]
    Windows1251,
    #[serde(rename = "windows-1252")]
    Windows1252,
    #[serde(rename = "windows-1253")]
    Windows1253,
    #[serde(rename = "windows-1254")]
    Windows1254,
    #[serde(rename = "windows-1255")]
    Windows1255,
    #[serde(rename = "windows-1256")]
    Windows1256,
    #[serde(rename = "windows-1257")]
    Windows1257,
    #[serde(rename = "windows-1258")]
    Windows1258,
    #[serde(rename = "IBM437")]
    Ibm437,
    #[serde(rename = "IBM866")]
    Ibm866,
    #[serde(rename = "Shift_JIS")]
    ShiftJis,
    Big5,
    #[serde(rename = "EUC-KR")]
    EucKr,
}
impl ::std::convert::From<&Self> for CharacterEncoding {
    fn from(value: &CharacterEncoding) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for CharacterEncoding {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Ascii => f.write_str("ASCII"),
            Self::Utf8 => f.write_str("UTF-8"),
            Self::Utf16be => f.write_str("UTF-16BE"),
            Self::Utf16le => f.write_str("UTF-16LE"),
            Self::Utf32be => f.write_str("UTF-32BE"),
            Self::Utf32le => f.write_str("UTF-32LE"),
            Self::Iso88591 => f.write_str("ISO-8859-1"),
            Self::Iso88592 => f.write_str("ISO-8859-2"),
            Self::Iso88593 => f.write_str("ISO-8859-3"),
            Self::Iso88594 => f.write_str("ISO-8859-4"),
            Self::Iso88595 => f.write_str("ISO-8859-5"),
            Self::Iso88596 => f.write_str("ISO-8859-6"),
            Self::Iso88597 => f.write_str("ISO-8859-7"),
            Self::Iso88598 => f.write_str("ISO-8859-8"),
            Self::Iso88599 => f.write_str("ISO-8859-9"),
            Self::Iso885910 => f.write_str("ISO-8859-10"),
            Self::Iso885911 => f.write_str("ISO-8859-11"),
            Self::Iso885913 => f.write_str("ISO-8859-13"),
            Self::Iso885914 => f.write_str("ISO-8859-14"),
            Self::Iso885915 => f.write_str("ISO-8859-15"),
            Self::Iso885916 => f.write_str("ISO-8859-16"),
            Self::Windows1250 => f.write_str("windows-1250"),
            Self::Windows1251 => f.write_str("windows-1251"),
            Self::Windows1252 => f.write_str("windows-1252"),
            Self::Windows1253 => f.write_str("windows-1253"),
            Self::Windows1254 => f.write_str("windows-1254"),
            Self::Windows1255 => f.write_str("windows-1255"),
            Self::Windows1256 => f.write_str("windows-1256"),
            Self::Windows1257 => f.write_str("windows-1257"),
            Self::Windows1258 => f.write_str("windows-1258"),
            Self::Ibm437 => f.write_str("IBM437"),
            Self::Ibm866 => f.write_str("IBM866"),
            Self::ShiftJis => f.write_str("Shift_JIS"),
            Self::Big5 => f.write_str("Big5"),
            Self::EucKr => f.write_str("EUC-KR"),
        }
    }
}
impl ::std::str::FromStr for CharacterEncoding {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "ASCII" => Ok(Self::Ascii),
            "UTF-8" => Ok(Self::Utf8),
            "UTF-16BE" => Ok(Self::Utf16be),
            "UTF-16LE" => Ok(Self::Utf16le),
            "UTF-32BE" => Ok(Self::Utf32be),
            "UTF-32LE" => Ok(Self::Utf32le),
            "ISO-8859-1" => Ok(Self::Iso88591),
            "ISO-8859-2" => Ok(Self::Iso88592),
            "ISO-8859-3" => Ok(Self::Iso88593),
            "ISO-8859-4" => Ok(Self::Iso88594),
            "ISO-8859-5" => Ok(Self::Iso88595),
            "ISO-8859-6" => Ok(Self::Iso88596),
            "ISO-8859-7" => Ok(Self::Iso88597),
            "ISO-8859-8" => Ok(Self::Iso88598),
            "ISO-8859-9" => Ok(Self::Iso88599),
            "ISO-8859-10" => Ok(Self::Iso885910),
            "ISO-8859-11" => Ok(Self::Iso885911),
            "ISO-8859-13" => Ok(Self::Iso885913),
            "ISO-8859-14" => Ok(Self::Iso885914),
            "ISO-8859-15" => Ok(Self::Iso885915),
            "ISO-8859-16" => Ok(Self::Iso885916),
            "windows-1250" => Ok(Self::Windows1250),
            "windows-1251" => Ok(Self::Windows1251),
            "windows-1252" => Ok(Self::Windows1252),
            "windows-1253" => Ok(Self::Windows1253),
            "windows-1254" => Ok(Self::Windows1254),
            "windows-1255" => Ok(Self::Windows1255),
            "windows-1256" => Ok(Self::Windows1256),
            "windows-1257" => Ok(Self::Windows1257),
            "windows-1258" => Ok(Self::Windows1258),
            "IBM437" => Ok(Self::Ibm437),
            "IBM866" => Ok(Self::Ibm866),
            "Shift_JIS" => Ok(Self::ShiftJis),
            "Big5" => Ok(Self::Big5),
            "EUC-KR" => Ok(Self::EucKr),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for CharacterEncoding {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for CharacterEncoding {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for CharacterEncoding {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
#[doc = "used to give a more detailed description of a user-defined type. In most languages, it will be used as a docstring compatible with tools like Javadoc, Doxygen, JSDoc, etc."]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"used to give a more detailed description of a user-defined type. In most languages, it will be used as a docstring compatible with tools like Javadoc, Doxygen, JSDoc, etc.\","]
#[doc = "  \"type\": \"string\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
#[serde(transparent)]
pub struct Doc(pub ::std::string::String);
impl ::std::ops::Deref for Doc {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<Doc> for ::std::string::String {
    fn from(value: Doc) -> Self {
        value.0
    }
}
impl ::std::convert::From<&Doc> for Doc {
    fn from(value: &Doc) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::string::String> for Doc {
    fn from(value: ::std::string::String) -> Self {
        Self(value)
    }
}
impl ::std::str::FromStr for Doc {
    type Err = ::std::convert::Infallible;
    fn from_str(value: &str) -> ::std::result::Result<Self, Self::Err> {
        Ok(Self(value.to_string()))
    }
}
impl ::std::fmt::Display for Doc {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        self.0.fmt(f)
    }
}
#[doc = "used to provide reference to original documentation (if the ksy file is actually an implementation of some documented format).\n\nContains:\n1. URL as text,\n2. arbitrary string, or\n3. URL as text + space + arbitrary string"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"used to provide reference to original documentation (if the ksy file is actually an implementation of some documented format).\\n\\nContains:\\n1. URL as text,\\n2. arbitrary string, or\\n3. URL as text + space + arbitrary string\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum DocRef {
    String(::std::string::String),
    Array(::std::vec::Vec<::std::string::String>),
}
impl ::std::convert::From<&Self> for DocRef {
    fn from(value: &DocRef) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<::std::string::String>> for DocRef {
    fn from(value: ::std::vec::Vec<::std::string::String>) -> Self {
        Self::Array(value)
    }
}
#[doc = "`EnumSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^.*$\": {"]
#[doc = "      \"$ref\": \"#/definitions/EnumValueSpec\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(transparent)]
pub struct EnumSpec(pub indexmap::IndexMap<EnumSpecKey, EnumValueSpec>);
impl ::std::ops::Deref for EnumSpec {
    type Target = indexmap::IndexMap<EnumSpecKey, EnumValueSpec>;
    fn deref(&self) -> &indexmap::IndexMap<EnumSpecKey, EnumValueSpec> {
        &self.0
    }
}
impl ::std::convert::From<EnumSpec> for indexmap::IndexMap<EnumSpecKey, EnumValueSpec> {
    fn from(value: EnumSpec) -> Self {
        value.0
    }
}
impl ::std::convert::From<&EnumSpec> for EnumSpec {
    fn from(value: &EnumSpec) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<indexmap::IndexMap<EnumSpecKey, EnumValueSpec>> for EnumSpec {
    fn from(value: indexmap::IndexMap<EnumSpecKey, EnumValueSpec>) -> Self {
        Self(value)
    }
}
#[doc = "`EnumSpecKey`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^.*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct EnumSpecKey(::std::string::String);
impl ::std::ops::Deref for EnumSpecKey {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<EnumSpecKey> for ::std::string::String {
    fn from(value: EnumSpecKey) -> Self {
        value.0
    }
}
impl ::std::convert::From<&EnumSpecKey> for EnumSpecKey {
    fn from(value: &EnumSpecKey) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for EnumSpecKey {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^.*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^.*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for EnumSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for EnumSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for EnumSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for EnumSpecKey {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`EnumValueSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/Identifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"id\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"-orig-id\": {"]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"type\": \"string\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"type\": \"string\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"doc\": {"]
#[doc = "          \"$ref\": \"#/definitions/Doc\""]
#[doc = "        },"]
#[doc = "        \"doc-ref\": {"]
#[doc = "          \"$ref\": \"#/definitions/DocRef\""]
#[doc = "        },"]
#[doc = "        \"id\": {"]
#[doc = "          \"$ref\": \"#/definitions/Identifier\""]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged, deny_unknown_fields)]
pub enum EnumValueSpec {
    Identifier(Identifier),
    Object {
        #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
        doc: ::std::option::Option<Doc>,
        #[serde(
            rename = "doc-ref",
            default,
            skip_serializing_if = "::std::option::Option::is_none"
        )]
        doc_ref: ::std::option::Option<DocRef>,
        id: Identifier,
        #[serde(
            rename = "-orig-id",
            default,
            skip_serializing_if = "::std::option::Option::is_none"
        )]
        orig_id: ::std::option::Option<EnumValueSpecObjectOrigId>,
    },
}
impl ::std::convert::From<&Self> for EnumValueSpec {
    fn from(value: &EnumValueSpec) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<Identifier> for EnumValueSpec {
    fn from(value: Identifier) -> Self {
        Self::Identifier(value)
    }
}
#[doc = "`EnumValueSpecObjectOrigId`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum EnumValueSpecObjectOrigId {
    String(::std::string::String),
    Array(::std::vec::Vec<::std::string::String>),
}
impl ::std::convert::From<&Self> for EnumValueSpecObjectOrigId {
    fn from(value: &EnumValueSpecObjectOrigId) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<::std::string::String>> for EnumValueSpecObjectOrigId {
    fn from(value: ::std::vec::Vec<::std::string::String>) -> Self {
        Self::Array(value)
    }
}
#[doc = "`EnumsSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^[a-z][a-z0-9_]*$\": {"]
#[doc = "      \"$ref\": \"#/definitions/EnumSpec\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(transparent)]
pub struct EnumsSpec(pub indexmap::IndexMap<EnumsSpecKey, EnumSpec>);
impl ::std::ops::Deref for EnumsSpec {
    type Target = indexmap::IndexMap<EnumsSpecKey, EnumSpec>;
    fn deref(&self) -> &indexmap::IndexMap<EnumsSpecKey, EnumSpec> {
        &self.0
    }
}
impl ::std::convert::From<EnumsSpec> for indexmap::IndexMap<EnumsSpecKey, EnumSpec> {
    fn from(value: EnumsSpec) -> Self {
        value.0
    }
}
impl ::std::convert::From<&EnumsSpec> for EnumsSpec {
    fn from(value: &EnumsSpec) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<indexmap::IndexMap<EnumsSpecKey, EnumSpec>> for EnumsSpec {
    fn from(value: indexmap::IndexMap<EnumsSpecKey, EnumSpec>) -> Self {
        Self(value)
    }
}
#[doc = "`EnumsSpecKey`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct EnumsSpecKey(::std::string::String);
impl ::std::ops::Deref for EnumsSpecKey {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<EnumsSpecKey> for ::std::string::String {
    fn from(value: EnumsSpecKey) -> Self {
        value.0
    }
}
impl ::std::convert::From<&EnumsSpecKey> for EnumsSpecKey {
    fn from(value: &EnumsSpecKey) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for EnumsSpecKey {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^[a-z][a-z0-9_]*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for EnumsSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for EnumsSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for EnumsSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for EnumsSpecKey {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`Identifier`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum Identifier {
    String(IdentifierString),
    Boolean(bool),
}
impl ::std::convert::From<&Self> for Identifier {
    fn from(value: &Identifier) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for Identifier {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        if let Ok(v) = value.parse() {
            Ok(Self::String(v))
        } else if let Ok(v) = value.parse() {
            Ok(Self::Boolean(v))
        } else {
            Err("string conversion failed for all variants".into())
        }
    }
}
impl ::std::convert::TryFrom<&str> for Identifier {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for Identifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for Identifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::fmt::Display for Identifier {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::String(x) => x.fmt(f),
            Self::Boolean(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<IdentifierString> for Identifier {
    fn from(value: IdentifierString) -> Self {
        Self::String(value)
    }
}
impl ::std::convert::From<bool> for Identifier {
    fn from(value: bool) -> Self {
        Self::Boolean(value)
    }
}
#[doc = "`IdentifierString`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct IdentifierString(::std::string::String);
impl ::std::ops::Deref for IdentifierString {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<IdentifierString> for ::std::string::String {
    fn from(value: IdentifierString) -> Self {
        value.0
    }
}
impl ::std::convert::From<&IdentifierString> for IdentifierString {
    fn from(value: &IdentifierString) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for IdentifierString {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^[a-z][a-z0-9_]*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for IdentifierString {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for IdentifierString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for IdentifierString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for IdentifierString {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`InstancesSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^[a-z][a-z0-9_]*$\": {"]
#[doc = "      \"$ref\": \"#/definitions/Attribute\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(transparent)]
pub struct InstancesSpec(pub indexmap::IndexMap<InstancesSpecKey, Attribute>);
impl ::std::ops::Deref for InstancesSpec {
    type Target = indexmap::IndexMap<InstancesSpecKey, Attribute>;
    fn deref(&self) -> &indexmap::IndexMap<InstancesSpecKey, Attribute> {
        &self.0
    }
}
impl ::std::convert::From<InstancesSpec> for indexmap::IndexMap<InstancesSpecKey, Attribute> {
    fn from(value: InstancesSpec) -> Self {
        value.0
    }
}
impl ::std::convert::From<&InstancesSpec> for InstancesSpec {
    fn from(value: &InstancesSpec) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<indexmap::IndexMap<InstancesSpecKey, Attribute>> for InstancesSpec {
    fn from(value: indexmap::IndexMap<InstancesSpecKey, Attribute>) -> Self {
        Self(value)
    }
}
#[doc = "`InstancesSpecKey`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct InstancesSpecKey(::std::string::String);
impl ::std::ops::Deref for InstancesSpecKey {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<InstancesSpecKey> for ::std::string::String {
    fn from(value: InstancesSpecKey) -> Self {
        value.0
    }
}
impl ::std::convert::From<&InstancesSpecKey> for InstancesSpecKey {
    fn from(value: &InstancesSpecKey) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for InstancesSpecKey {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^[a-z][a-z0-9_]*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for InstancesSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for InstancesSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for InstancesSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for InstancesSpecKey {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`IsoIdentifier`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^[1-9]\\\\d*(-[0-9]+)?(:(19|20)\\\\d{2})?$\","]
#[doc = "  \"$comment\": \"https://www.wikidata.org/wiki/Property:P503#P1793, but only allow ASCII hyphen (-), not the Unicode en dash\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct IsoIdentifier(::std::string::String);
impl ::std::ops::Deref for IsoIdentifier {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<IsoIdentifier> for ::std::string::String {
    fn from(value: IsoIdentifier) -> Self {
        value.0
    }
}
impl ::std::convert::From<&IsoIdentifier> for IsoIdentifier {
    fn from(value: &IsoIdentifier) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for IsoIdentifier {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^[1-9]\\d*(-[0-9]+)?(:(19|20)\\d{2})?$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[1-9]\\d*(-[0-9]+)?(:(19|20)\\d{2})?$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for IsoIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for IsoIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for IsoIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for IsoIdentifier {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "the schema for ksy files"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"title\": \"ksy schema\","]
#[doc = "  \"description\": \"the schema for ksy files\","]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"properties\": {"]
#[doc = "    \"doc\": {"]
#[doc = "      \"$ref\": \"#/definitions/Doc\""]
#[doc = "    },"]
#[doc = "    \"doc-ref\": {"]
#[doc = "      \"$ref\": \"#/definitions/DocRef\""]
#[doc = "    },"]
#[doc = "    \"enums\": {"]
#[doc = "      \"description\": \"allows for the setup of named enums, mappings of integer constants to symbolic names. Can be used with integer attributes using the enum key.\\n\\nwould be represented as enum-like construct (or closest equivalent, if target language doesn't support enums), nested or namespaced in current type/class\","]
#[doc = "      \"$ref\": \"#/definitions/EnumsSpec\""]
#[doc = "    },"]
#[doc = "    \"instances\": {"]
#[doc = "      \"description\": \"Purpose: description of data that lies outside of normal sequential parsing flow (for example, that requires seeking somewhere in the file) or just needs to be loaded only by special request\\n\\nInfluences: would be translated into distinct methods (that read desired data on demand) in current class\","]
#[doc = "      \"$ref\": \"#/definitions/InstancesSpec\""]
#[doc = "    },"]
#[doc = "    \"meta\": {"]
#[doc = "      \"required\": ["]
#[doc = "        \"id\""]
#[doc = "      ],"]
#[doc = "      \"$ref\": \"#/definitions/MetaSpec\""]
#[doc = "    },"]
#[doc = "    \"params\": {"]
#[doc = "      \"$ref\": \"#/definitions/ParamsSpec\""]
#[doc = "    },"]
#[doc = "    \"seq\": {"]
#[doc = "      \"description\": \"identifier for a primary structure described in top-level map\","]
#[doc = "      \"$ref\": \"#/definitions/Attributes\""]
#[doc = "    },"]
#[doc = "    \"to-string\": {"]
#[doc = "      \"$ref\": \"#/definitions/ToString\""]
#[doc = "    },"]
#[doc = "    \"types\": {"]
#[doc = "      \"description\": \"maps of strings to user-defined types\\n\\ndeclares types for substructures that can be referenced in the attributes of seq or instances element\\n\\nwould be directly translated into classes\","]
#[doc = "      \"$ref\": \"#/definitions/TypesSpec\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct KsySchema {
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub doc: ::std::option::Option<Doc>,
    #[serde(
        rename = "doc-ref",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub doc_ref: ::std::option::Option<DocRef>,
    #[doc = "allows for the setup of named enums, mappings of integer constants to symbolic names. Can be used with integer attributes using the enum key.\n\nwould be represented as enum-like construct (or closest equivalent, if target language doesn't support enums), nested or namespaced in current type/class"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub enums: ::std::option::Option<EnumsSpec>,
    #[doc = "Purpose: description of data that lies outside of normal sequential parsing flow (for example, that requires seeking somewhere in the file) or just needs to be loaded only by special request\n\nInfluences: would be translated into distinct methods (that read desired data on demand) in current class"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub instances: ::std::option::Option<InstancesSpec>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub meta: ::std::option::Option<KsySchemaMeta>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub params: ::std::option::Option<ParamsSpec>,
    #[doc = "identifier for a primary structure described in top-level map"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub seq: ::std::option::Option<Attributes>,
    #[serde(
        rename = "to-string",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub to_string: ::std::option::Option<ToString>,
    #[doc = "maps of strings to user-defined types\n\ndeclares types for substructures that can be referenced in the attributes of seq or instances element\n\nwould be directly translated into classes"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub types: ::std::option::Option<TypesSpec>,
}
impl ::std::convert::From<&KsySchema> for KsySchema {
    fn from(value: &KsySchema) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for KsySchema {
    fn default() -> Self {
        Self {
            doc: Default::default(),
            doc_ref: Default::default(),
            enums: Default::default(),
            instances: Default::default(),
            meta: Default::default(),
            params: Default::default(),
            seq: Default::default(),
            to_string: Default::default(),
            types: Default::default(),
        }
    }
}
#[doc = "`KsySchemaMeta`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"required\": ["]
#[doc = "    \"id\""]
#[doc = "  ],"]
#[doc = "  \"properties\": {"]
#[doc = "    \"application\": {"]
#[doc = "      \"description\": \"applications that use this format and are typically associated with it\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"type\": \"string\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"bit-endian\": {"]
#[doc = "      \"description\": \"default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\\n\\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\\n\\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\\n\\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers\","]
#[doc = "      \"default\": \"be\","]
#[doc = "      \"enum\": ["]
#[doc = "        \"le\","]
#[doc = "        \"be\""]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"encoding\": {"]
#[doc = "      \"description\": \"default character encoding for string fields (of type `str` or `strz`) in the current type and its subtypes\","]
#[doc = "      \"$ref\": \"#/definitions/CharacterEncoding\""]
#[doc = "    },"]
#[doc = "    \"endian\": {"]
#[doc = "      \"description\": \"default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\\n\\napplies to the current type and its subtypes\\n\\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"enum\": ["]
#[doc = "            \"le\","]
#[doc = "            \"be\""]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"object\","]
#[doc = "          \"required\": ["]
#[doc = "            \"cases\","]
#[doc = "            \"switch-on\""]
#[doc = "          ],"]
#[doc = "          \"properties\": {"]
#[doc = "            \"cases\": {"]
#[doc = "              \"type\": \"object\","]
#[doc = "              \"patternProperties\": {"]
#[doc = "                \"^.*$\": {"]
#[doc = "                  \"enum\": ["]
#[doc = "                    \"le\","]
#[doc = "                    \"be\""]
#[doc = "                  ]"]
#[doc = "                }"]
#[doc = "              },"]
#[doc = "              \"additionalProperties\": false"]
#[doc = "            },"]
#[doc = "            \"switch-on\": {"]
#[doc = "              \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "            }"]
#[doc = "          },"]
#[doc = "          \"patternProperties\": {"]
#[doc = "            \"^-\": true"]
#[doc = "          },"]
#[doc = "          \"additionalProperties\": false"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"file-extension\": {"]
#[doc = "      \"description\": \"file extensions typically used for this format, without the leading dot and in lowercase letters\\n\\nshould be sorted from most popular to least popular\","]
#[doc = "      \"examples\": ["]
#[doc = "        \"exe\","]
#[doc = "        ["]
#[doc = "          \"jpg\","]
#[doc = "          \"jpeg\""]
#[doc = "        ]"]
#[doc = "      ],"]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"type\": \"string\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"id\": {"]
#[doc = "      \"description\": \"unique string that identifies this format\\n\\nshould be identical to the file name without the `.ksy` extension (e.g. `microsoft_pe` for `microsoft_pe.ksy`)\\n\\nused to derive the name of the top-level type when generating parsers\\n\\nrequired at the top level, shouldn't be used at nested levels\","]
#[doc = "      \"$ref\": \"#/definitions/Identifier\""]
#[doc = "    },"]
#[doc = "    \"imports\": {"]
#[doc = "      \"description\": \"list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\\n\\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\","]
#[doc = "          \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\","]
#[doc = "          \"$comment\": \"https://github.com/kaitai-io/kaitai_struct_tests/commit/85973798aa2ffda7008b2359eeb769a11bc90dad\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"type\": \"string\","]
#[doc = "            \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"ks-debug\": {"]
#[doc = "      \"description\": \"advise the Kaitai Struct Compiler (KSC) to use debug mode\","]
#[doc = "      \"default\": false,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"ks-opaque-types\": {"]
#[doc = "      \"description\": \"advise the Kaitai Struct Compiler (KSC) to ignore missing types in the .ksy file, and assume that these types are already provided externally by the environment the classes are generated for\","]
#[doc = "      \"default\": false,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"ks-version\": {"]
#[doc = "      \"description\": \"minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\\n\\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\\n\\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\","]
#[doc = "          \"pattern\": \"^(0\\\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\\\.(0|[1-9][0-9]*))(\\\\.(0|[1-9][0-9]*))?$\","]
#[doc = "          \"$comment\": \"See 1. https://github.com/kaitai-io/kaitai_struct_compiler/commit/aa10f0751e7e26fbb48afd1afc6a8a591268f4d9 2. https://github.com/kaitai-io/kaitai_struct_compiler/commit/df6463a65df8b78f85f7d37e2bb43a94e1622d68\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"number\","]
#[doc = "          \"not\": {"]
#[doc = "            \"enum\": ["]
#[doc = "              0.1,"]
#[doc = "              0.2,"]
#[doc = "              0.3,"]
#[doc = "              0.4,"]
#[doc = "              0.5"]
#[doc = "            ]"]
#[doc = "          },"]
#[doc = "          \"minimum\": 0.1"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"license\": {"]
#[doc = "      \"description\": \"license under which the KSY file is released\\n\\nrequired for all KSY specifications in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) (otherwise optional, but [highly recommended](https://choosealicense.com/no-permission/))\\n\\nmust be a valid [SPDX expression](https://spdx.github.io/spdx-spec/v3.0.1/annexes/spdx-license-expressions/) (however, a single license identifier from [this list](https://spdx.org/licenses/) is usually enough)\\n\\nto clarify, this is not a license of the original format description, but a license of the particular KSY implementation - if you're writing one, you can choose any open source license you want, regardless of what resources you use (as long as you only reproduce the idea and you don't copy long excerpts); we recommend [`CC0-1.0`](https://spdx.org/licenses/CC0-1.0.html) or [`MIT`](https://spdx.org/licenses/MIT.html)\\n\\ngenerated files from a KSY spec retain the same license as the original KSY\","]
#[doc = "      \"examples\": ["]
#[doc = "        \"CC0-1.0\","]
#[doc = "        \"MIT\""]
#[doc = "      ],"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    \"tags\": {"]
#[doc = "      \"description\": \"list of tags (categories/keywords) that can be assigned to the format\\n\\nused in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) to display formats at https://formats.kaitai.io/ also in categories other than the main one, which corresponds to the directory where the `.ksy` file is located\\n\\nshould match the directory names in https://github.com/kaitai-io/kaitai_struct_formats\\n\\nshould be written in `lower_snake_case` and sorted in alphabetical order\","]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    },"]
#[doc = "    \"title\": {"]
#[doc = "      \"description\": \"brief name of the format\","]
#[doc = "      \"examples\": ["]
#[doc = "        \"Windows PE executable\""]
#[doc = "      ],"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    \"xref\": {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"properties\": {"]
#[doc = "        \"forensicswiki\": {"]
#[doc = "          \"description\": \"article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\\n\\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"iso\": {"]
#[doc = "          \"description\": \"ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\\n\\nISO standards typically have clear designations like \\\"ISO/IEC 15948:2004\\\", so value should be citing everything except for \\\"ISO/IEC\\\", i.e. `15948:2004`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"justsolve\": {"]
#[doc = "          \"description\": \"article name at [\\\"Just Solve the File Format Problem\\\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\\n\\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"loc\": {"]
#[doc = "          \"description\": \"identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\\n\\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"mime\": {"]
#[doc = "          \"description\": \"MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\\n\\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\\n\\nvalue must specify full MIME type (both parts), e.g. `image/png`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/MimeType\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/MimeType\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"pronom\": {"]
#[doc = "          \"description\": \"format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"rfc\": {"]
#[doc = "          \"description\": \"reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \\\"Request for Comments\\\" documents maintained by ISOC (Internet Society)\\n\\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\\n\\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"wikidata\": {"]
#[doc = "          \"description\": \"item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\\n\\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^.*$\": {"]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct KsySchemaMeta {
    #[doc = "applications that use this format and are typically associated with it"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub application: ::std::option::Option<KsySchemaMetaApplication>,
    #[doc = "default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\n\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\n\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\n\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers"]
    #[serde(
        rename = "bit-endian",
        default = "defaults::ksy_schema_meta_bit_endian"
    )]
    pub bit_endian: KsySchemaMetaBitEndian,
    #[doc = "default character encoding for string fields (of type `str` or `strz`) in the current type and its subtypes"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub encoding: ::std::option::Option<CharacterEncoding>,
    #[doc = "default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\n\napplies to the current type and its subtypes\n\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub endian: ::std::option::Option<KsySchemaMetaEndian>,
    #[doc = "file extensions typically used for this format, without the leading dot and in lowercase letters\n\nshould be sorted from most popular to least popular"]
    #[serde(
        rename = "file-extension",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub file_extension: ::std::option::Option<KsySchemaMetaFileExtension>,
    #[doc = "unique string that identifies this format\n\nshould be identical to the file name without the `.ksy` extension (e.g. `microsoft_pe` for `microsoft_pe.ksy`)\n\nused to derive the name of the top-level type when generating parsers\n\nrequired at the top level, shouldn't be used at nested levels"]
    pub id: Identifier,
    #[doc = "list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\n\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub imports: ::std::option::Option<KsySchemaMetaImports>,
    #[doc = "advise the Kaitai Struct Compiler (KSC) to use debug mode"]
    #[serde(
        rename = "ks-debug",
        default = "defaults::default_bool::<false>",
        skip_serializing_if = "defaults::is_bool::<false>"
    )]
    pub ks_debug: bool,
    #[doc = "advise the Kaitai Struct Compiler (KSC) to ignore missing types in the .ksy file, and assume that these types are already provided externally by the environment the classes are generated for"]
    #[serde(
        rename = "ks-opaque-types",
        default = "defaults::default_bool::<false>",
        skip_serializing_if = "defaults::is_bool::<false>"
    )]
    pub ks_opaque_types: bool,
    #[doc = "minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\n\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\n\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)"]
    #[serde(
        rename = "ks-version",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub ks_version: ::std::option::Option<KsySchemaMetaKsVersion>,
    #[doc = "license under which the KSY file is released\n\nrequired for all KSY specifications in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) (otherwise optional, but [highly recommended](https://choosealicense.com/no-permission/))\n\nmust be a valid [SPDX expression](https://spdx.github.io/spdx-spec/v3.0.1/annexes/spdx-license-expressions/) (however, a single license identifier from [this list](https://spdx.org/licenses/) is usually enough)\n\nto clarify, this is not a license of the original format description, but a license of the particular KSY implementation - if you're writing one, you can choose any open source license you want, regardless of what resources you use (as long as you only reproduce the idea and you don't copy long excerpts); we recommend [`CC0-1.0`](https://spdx.org/licenses/CC0-1.0.html) or [`MIT`](https://spdx.org/licenses/MIT.html)\n\ngenerated files from a KSY spec retain the same license as the original KSY"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub license: ::std::option::Option<::std::string::String>,
    #[doc = "list of tags (categories/keywords) that can be assigned to the format\n\nused in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) to display formats at https://formats.kaitai.io/ also in categories other than the main one, which corresponds to the directory where the `.ksy` file is located\n\nshould match the directory names in https://github.com/kaitai-io/kaitai_struct_formats\n\nshould be written in `lower_snake_case` and sorted in alphabetical order"]
    #[serde(default, skip_serializing_if = "::std::vec::Vec::is_empty")]
    pub tags: ::std::vec::Vec<::std::string::String>,
    #[doc = "brief name of the format"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub title: ::std::option::Option<::std::string::String>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub xref: ::std::option::Option<KsySchemaMetaXref>,
}
impl ::std::convert::From<&KsySchemaMeta> for KsySchemaMeta {
    fn from(value: &KsySchemaMeta) -> Self {
        value.clone()
    }
}
#[doc = "applications that use this format and are typically associated with it"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"applications that use this format and are typically associated with it\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaApplication {
    String(::std::string::String),
    Array(::std::vec::Vec<::std::string::String>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaApplication {
    fn from(value: &KsySchemaMetaApplication) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<::std::string::String>> for KsySchemaMetaApplication {
    fn from(value: ::std::vec::Vec<::std::string::String>) -> Self {
        Self::Array(value)
    }
}
#[doc = "default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\n\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\n\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\n\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\\n\\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\\n\\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\\n\\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers\","]
#[doc = "  \"default\": \"be\","]
#[doc = "  \"enum\": ["]
#[doc = "    \"le\","]
#[doc = "    \"be\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum KsySchemaMetaBitEndian {
    #[serde(rename = "le")]
    Le,
    #[serde(rename = "be")]
    Be,
}
impl ::std::convert::From<&Self> for KsySchemaMetaBitEndian {
    fn from(value: &KsySchemaMetaBitEndian) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for KsySchemaMetaBitEndian {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Le => f.write_str("le"),
            Self::Be => f.write_str("be"),
        }
    }
}
impl ::std::str::FromStr for KsySchemaMetaBitEndian {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "le" => Ok(Self::Le),
            "be" => Ok(Self::Be),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaBitEndian {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaBitEndian {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaBitEndian {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::default::Default for KsySchemaMetaBitEndian {
    fn default() -> Self {
        KsySchemaMetaBitEndian::Be
    }
}
#[doc = "default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\n\napplies to the current type and its subtypes\n\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\\n\\napplies to the current type and its subtypes\\n\\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"enum\": ["]
#[doc = "        \"le\","]
#[doc = "        \"be\""]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"cases\","]
#[doc = "        \"switch-on\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"cases\": {"]
#[doc = "          \"type\": \"object\","]
#[doc = "          \"patternProperties\": {"]
#[doc = "            \"^.*$\": {"]
#[doc = "              \"enum\": ["]
#[doc = "                \"le\","]
#[doc = "                \"be\""]
#[doc = "              ]"]
#[doc = "            }"]
#[doc = "          },"]
#[doc = "          \"additionalProperties\": false"]
#[doc = "        },"]
#[doc = "        \"switch-on\": {"]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged, deny_unknown_fields)]
pub enum KsySchemaMetaEndian {
    Variant0(KsySchemaMetaEndianVariant0),
    Variant1 {
        cases: indexmap::IndexMap<
            KsySchemaMetaEndianVariant1CasesKey,
            KsySchemaMetaEndianVariant1CasesValue,
        >,
        #[serde(rename = "switch-on")]
        switch_on: AnyScalar,
    },
}
impl ::std::convert::From<&Self> for KsySchemaMetaEndian {
    fn from(value: &KsySchemaMetaEndian) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<KsySchemaMetaEndianVariant0> for KsySchemaMetaEndian {
    fn from(value: KsySchemaMetaEndianVariant0) -> Self {
        Self::Variant0(value)
    }
}
#[doc = "`KsySchemaMetaEndianVariant0`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"enum\": ["]
#[doc = "    \"le\","]
#[doc = "    \"be\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum KsySchemaMetaEndianVariant0 {
    #[serde(rename = "le")]
    Le,
    #[serde(rename = "be")]
    Be,
}
impl ::std::convert::From<&Self> for KsySchemaMetaEndianVariant0 {
    fn from(value: &KsySchemaMetaEndianVariant0) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for KsySchemaMetaEndianVariant0 {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Le => f.write_str("le"),
            Self::Be => f.write_str("be"),
        }
    }
}
impl ::std::str::FromStr for KsySchemaMetaEndianVariant0 {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "le" => Ok(Self::Le),
            "be" => Ok(Self::Be),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaEndianVariant0 {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaEndianVariant0 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaEndianVariant0 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
#[doc = "`KsySchemaMetaEndianVariant1CasesKey`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^.*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct KsySchemaMetaEndianVariant1CasesKey(::std::string::String);
impl ::std::ops::Deref for KsySchemaMetaEndianVariant1CasesKey {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<KsySchemaMetaEndianVariant1CasesKey> for ::std::string::String {
    fn from(value: KsySchemaMetaEndianVariant1CasesKey) -> Self {
        value.0
    }
}
impl ::std::convert::From<&KsySchemaMetaEndianVariant1CasesKey>
    for KsySchemaMetaEndianVariant1CasesKey
{
    fn from(value: &KsySchemaMetaEndianVariant1CasesKey) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for KsySchemaMetaEndianVariant1CasesKey {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^.*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^.*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaEndianVariant1CasesKey {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaEndianVariant1CasesKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaEndianVariant1CasesKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for KsySchemaMetaEndianVariant1CasesKey {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`KsySchemaMetaEndianVariant1CasesValue`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"enum\": ["]
#[doc = "    \"le\","]
#[doc = "    \"be\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum KsySchemaMetaEndianVariant1CasesValue {
    #[serde(rename = "le")]
    Le,
    #[serde(rename = "be")]
    Be,
}
impl ::std::convert::From<&Self> for KsySchemaMetaEndianVariant1CasesValue {
    fn from(value: &KsySchemaMetaEndianVariant1CasesValue) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for KsySchemaMetaEndianVariant1CasesValue {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Le => f.write_str("le"),
            Self::Be => f.write_str("be"),
        }
    }
}
impl ::std::str::FromStr for KsySchemaMetaEndianVariant1CasesValue {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "le" => Ok(Self::Le),
            "be" => Ok(Self::Be),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaEndianVariant1CasesValue {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaEndianVariant1CasesValue {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaEndianVariant1CasesValue {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
#[doc = "file extensions typically used for this format, without the leading dot and in lowercase letters\n\nshould be sorted from most popular to least popular"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"file extensions typically used for this format, without the leading dot and in lowercase letters\\n\\nshould be sorted from most popular to least popular\","]
#[doc = "  \"examples\": ["]
#[doc = "    \"exe\","]
#[doc = "    ["]
#[doc = "      \"jpg\","]
#[doc = "      \"jpeg\""]
#[doc = "    ]"]
#[doc = "  ],"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaFileExtension {
    String(::std::string::String),
    Array(::std::vec::Vec<::std::string::String>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaFileExtension {
    fn from(value: &KsySchemaMetaFileExtension) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<::std::string::String>> for KsySchemaMetaFileExtension {
    fn from(value: ::std::vec::Vec<::std::string::String>) -> Self {
        Self::Array(value)
    }
}
#[doc = "list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\n\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\\n\\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\","]
#[doc = "      \"$comment\": \"https://github.com/kaitai-io/kaitai_struct_tests/commit/85973798aa2ffda7008b2359eeb769a11bc90dad\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\","]
#[doc = "        \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaImports {
    String(KsySchemaMetaImportsString),
    Array(::std::vec::Vec<KsySchemaMetaImportsArrayItem>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaImports {
    fn from(value: &KsySchemaMetaImports) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<KsySchemaMetaImportsString> for KsySchemaMetaImports {
    fn from(value: KsySchemaMetaImportsString) -> Self {
        Self::String(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<KsySchemaMetaImportsArrayItem>> for KsySchemaMetaImports {
    fn from(value: ::std::vec::Vec<KsySchemaMetaImportsArrayItem>) -> Self {
        Self::Array(value)
    }
}
#[doc = "`KsySchemaMetaImportsArrayItem`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct KsySchemaMetaImportsArrayItem(::std::string::String);
impl ::std::ops::Deref for KsySchemaMetaImportsArrayItem {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<KsySchemaMetaImportsArrayItem> for ::std::string::String {
    fn from(value: KsySchemaMetaImportsArrayItem) -> Self {
        value.0
    }
}
impl ::std::convert::From<&KsySchemaMetaImportsArrayItem> for KsySchemaMetaImportsArrayItem {
    fn from(value: &KsySchemaMetaImportsArrayItem) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for KsySchemaMetaImportsArrayItem {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^(.*/)?[a-z][a-z0-9_]*$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^(.*/)?[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaImportsArrayItem {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaImportsArrayItem {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaImportsArrayItem {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for KsySchemaMetaImportsArrayItem {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`KsySchemaMetaImportsString`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\","]
#[doc = "  \"$comment\": \"https://github.com/kaitai-io/kaitai_struct_tests/commit/85973798aa2ffda7008b2359eeb769a11bc90dad\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct KsySchemaMetaImportsString(::std::string::String);
impl ::std::ops::Deref for KsySchemaMetaImportsString {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<KsySchemaMetaImportsString> for ::std::string::String {
    fn from(value: KsySchemaMetaImportsString) -> Self {
        value.0
    }
}
impl ::std::convert::From<&KsySchemaMetaImportsString> for KsySchemaMetaImportsString {
    fn from(value: &KsySchemaMetaImportsString) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for KsySchemaMetaImportsString {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^(.*/)?[a-z][a-z0-9_]*$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^(.*/)?[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaImportsString {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaImportsString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaImportsString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for KsySchemaMetaImportsString {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\n\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\n\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\\n\\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\\n\\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^(0\\\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\\\.(0|[1-9][0-9]*))(\\\\.(0|[1-9][0-9]*))?$\","]
#[doc = "      \"$comment\": \"See 1. https://github.com/kaitai-io/kaitai_struct_compiler/commit/aa10f0751e7e26fbb48afd1afc6a8a591268f4d9 2. https://github.com/kaitai-io/kaitai_struct_compiler/commit/df6463a65df8b78f85f7d37e2bb43a94e1622d68\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"number\","]
#[doc = "      \"not\": {"]
#[doc = "        \"enum\": ["]
#[doc = "          0.1,"]
#[doc = "          0.2,"]
#[doc = "          0.3,"]
#[doc = "          0.4,"]
#[doc = "          0.5"]
#[doc = "        ]"]
#[doc = "      },"]
#[doc = "      \"minimum\": 0.1"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaKsVersion {
    String(KsySchemaMetaKsVersionString),
    Number(f64),
}
impl ::std::convert::From<&Self> for KsySchemaMetaKsVersion {
    fn from(value: &KsySchemaMetaKsVersion) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for KsySchemaMetaKsVersion {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        if let Ok(v) = value.parse() {
            Ok(Self::String(v))
        } else if let Ok(v) = value.parse() {
            Ok(Self::Number(v))
        } else {
            Err("string conversion failed for all variants".into())
        }
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaKsVersion {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaKsVersion {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaKsVersion {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::fmt::Display for KsySchemaMetaKsVersion {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::String(x) => x.fmt(f),
            Self::Number(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<KsySchemaMetaKsVersionString> for KsySchemaMetaKsVersion {
    fn from(value: KsySchemaMetaKsVersionString) -> Self {
        Self::String(value)
    }
}
impl ::std::convert::From<f64> for KsySchemaMetaKsVersion {
    fn from(value: f64) -> Self {
        Self::Number(value)
    }
}
#[doc = "`KsySchemaMetaKsVersionString`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(0\\\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\\\.(0|[1-9][0-9]*))(\\\\.(0|[1-9][0-9]*))?$\","]
#[doc = "  \"$comment\": \"See 1. https://github.com/kaitai-io/kaitai_struct_compiler/commit/aa10f0751e7e26fbb48afd1afc6a8a591268f4d9 2. https://github.com/kaitai-io/kaitai_struct_compiler/commit/df6463a65df8b78f85f7d37e2bb43a94e1622d68\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct KsySchemaMetaKsVersionString(::std::string::String);
impl ::std::ops::Deref for KsySchemaMetaKsVersionString {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<KsySchemaMetaKsVersionString> for ::std::string::String {
    fn from(value: KsySchemaMetaKsVersionString) -> Self {
        value.0
    }
}
impl ::std::convert::From<&KsySchemaMetaKsVersionString> for KsySchemaMetaKsVersionString {
    fn from(value: &KsySchemaMetaKsVersionString) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for KsySchemaMetaKsVersionString {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> = ::std::sync::LazyLock::new(
            || {
                :: regress :: Regex :: new ("^(0\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\.(0|[1-9][0-9]*))(\\.(0|[1-9][0-9]*))?$") . unwrap ()
            },
        );
        if PATTERN.find(value).is_none() {
            return Err ("doesn't match pattern \"^(0\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\.(0|[1-9][0-9]*))(\\.(0|[1-9][0-9]*))?$\"" . into ()) ;
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for KsySchemaMetaKsVersionString {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for KsySchemaMetaKsVersionString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for KsySchemaMetaKsVersionString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for KsySchemaMetaKsVersionString {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`KsySchemaMetaXref`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"properties\": {"]
#[doc = "    \"forensicswiki\": {"]
#[doc = "      \"description\": \"article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\\n\\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"iso\": {"]
#[doc = "      \"description\": \"ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\\n\\nISO standards typically have clear designations like \\\"ISO/IEC 15948:2004\\\", so value should be citing everything except for \\\"ISO/IEC\\\", i.e. `15948:2004`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"justsolve\": {"]
#[doc = "      \"description\": \"article name at [\\\"Just Solve the File Format Problem\\\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\\n\\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"loc\": {"]
#[doc = "      \"description\": \"identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\\n\\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"mime\": {"]
#[doc = "      \"description\": \"MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\\n\\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\\n\\nvalue must specify full MIME type (both parts), e.g. `image/png`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/MimeType\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/MimeType\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"pronom\": {"]
#[doc = "      \"description\": \"format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"rfc\": {"]
#[doc = "      \"description\": \"reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \\\"Request for Comments\\\" documents maintained by ISOC (Internet Society)\\n\\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\\n\\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"wikidata\": {"]
#[doc = "      \"description\": \"item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\\n\\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^.*$\": {"]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct KsySchemaMetaXref {
    #[doc = "article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\n\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub forensicswiki: ::std::option::Option<KsySchemaMetaXrefForensicswiki>,
    #[doc = "ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\n\nISO standards typically have clear designations like \"ISO/IEC 15948:2004\", so value should be citing everything except for \"ISO/IEC\", i.e. `15948:2004`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub iso: ::std::option::Option<KsySchemaMetaXrefIso>,
    #[doc = "article name at [\"Just Solve the File Format Problem\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\n\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub justsolve: ::std::option::Option<KsySchemaMetaXrefJustsolve>,
    #[doc = "identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\n\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub loc: ::std::option::Option<KsySchemaMetaXrefLoc>,
    #[doc = "MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\n\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\n\nvalue must specify full MIME type (both parts), e.g. `image/png`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub mime: ::std::option::Option<KsySchemaMetaXrefMime>,
    #[doc = "format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub pronom: ::std::option::Option<KsySchemaMetaXrefPronom>,
    #[doc = "reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \"Request for Comments\" documents maintained by ISOC (Internet Society)\n\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\n\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub rfc: ::std::option::Option<KsySchemaMetaXrefRfc>,
    #[doc = "item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\n\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub wikidata: ::std::option::Option<KsySchemaMetaXrefWikidata>,
}
impl ::std::convert::From<&KsySchemaMetaXref> for KsySchemaMetaXref {
    fn from(value: &KsySchemaMetaXref) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for KsySchemaMetaXref {
    fn default() -> Self {
        Self {
            forensicswiki: Default::default(),
            iso: Default::default(),
            justsolve: Default::default(),
            loc: Default::default(),
            mime: Default::default(),
            pronom: Default::default(),
            rfc: Default::default(),
            wikidata: Default::default(),
        }
    }
}
#[doc = "article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\n\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\\n\\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefForensicswiki {
    MediaWikiPageName(MediaWikiPageName),
    Array(::std::vec::Vec<MediaWikiPageName>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefForensicswiki {
    fn from(value: &KsySchemaMetaXrefForensicswiki) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MediaWikiPageName> for KsySchemaMetaXrefForensicswiki {
    fn from(value: MediaWikiPageName) -> Self {
        Self::MediaWikiPageName(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<MediaWikiPageName>> for KsySchemaMetaXrefForensicswiki {
    fn from(value: ::std::vec::Vec<MediaWikiPageName>) -> Self {
        Self::Array(value)
    }
}
#[doc = "ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\n\nISO standards typically have clear designations like \"ISO/IEC 15948:2004\", so value should be citing everything except for \"ISO/IEC\", i.e. `15948:2004`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\\n\\nISO standards typically have clear designations like \\\"ISO/IEC 15948:2004\\\", so value should be citing everything except for \\\"ISO/IEC\\\", i.e. `15948:2004`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefIso {
    IsoIdentifier(IsoIdentifier),
    Array(::std::vec::Vec<IsoIdentifier>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefIso {
    fn from(value: &KsySchemaMetaXrefIso) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<IsoIdentifier> for KsySchemaMetaXrefIso {
    fn from(value: IsoIdentifier) -> Self {
        Self::IsoIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<IsoIdentifier>> for KsySchemaMetaXrefIso {
    fn from(value: ::std::vec::Vec<IsoIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "article name at [\"Just Solve the File Format Problem\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\n\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"article name at [\\\"Just Solve the File Format Problem\\\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\\n\\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefJustsolve {
    MediaWikiPageName(MediaWikiPageName),
    Array(::std::vec::Vec<MediaWikiPageName>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefJustsolve {
    fn from(value: &KsySchemaMetaXrefJustsolve) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MediaWikiPageName> for KsySchemaMetaXrefJustsolve {
    fn from(value: MediaWikiPageName) -> Self {
        Self::MediaWikiPageName(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<MediaWikiPageName>> for KsySchemaMetaXrefJustsolve {
    fn from(value: ::std::vec::Vec<MediaWikiPageName>) -> Self {
        Self::Array(value)
    }
}
#[doc = "identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\n\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\\n\\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefLoc {
    LocIdentifier(LocIdentifier),
    Array(::std::vec::Vec<LocIdentifier>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefLoc {
    fn from(value: &KsySchemaMetaXrefLoc) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<LocIdentifier> for KsySchemaMetaXrefLoc {
    fn from(value: LocIdentifier) -> Self {
        Self::LocIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<LocIdentifier>> for KsySchemaMetaXrefLoc {
    fn from(value: ::std::vec::Vec<LocIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\n\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\n\nvalue must specify full MIME type (both parts), e.g. `image/png`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\\n\\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\\n\\nvalue must specify full MIME type (both parts), e.g. `image/png`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/MimeType\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/MimeType\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefMime {
    MimeType(MimeType),
    Array(::std::vec::Vec<MimeType>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefMime {
    fn from(value: &KsySchemaMetaXrefMime) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MimeType> for KsySchemaMetaXrefMime {
    fn from(value: MimeType) -> Self {
        Self::MimeType(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<MimeType>> for KsySchemaMetaXrefMime {
    fn from(value: ::std::vec::Vec<MimeType>) -> Self {
        Self::Array(value)
    }
}
#[doc = "format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefPronom {
    PronomIdentifier(PronomIdentifier),
    Array(::std::vec::Vec<PronomIdentifier>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefPronom {
    fn from(value: &KsySchemaMetaXrefPronom) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<PronomIdentifier> for KsySchemaMetaXrefPronom {
    fn from(value: PronomIdentifier) -> Self {
        Self::PronomIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<PronomIdentifier>> for KsySchemaMetaXrefPronom {
    fn from(value: ::std::vec::Vec<PronomIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \"Request for Comments\" documents maintained by ISOC (Internet Society)\n\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\n\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \\\"Request for Comments\\\" documents maintained by ISOC (Internet Society)\\n\\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\\n\\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefRfc {
    RfcIdentifier(RfcIdentifier),
    Array(::std::vec::Vec<RfcIdentifier>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefRfc {
    fn from(value: &KsySchemaMetaXrefRfc) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<RfcIdentifier> for KsySchemaMetaXrefRfc {
    fn from(value: RfcIdentifier) -> Self {
        Self::RfcIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<RfcIdentifier>> for KsySchemaMetaXrefRfc {
    fn from(value: ::std::vec::Vec<RfcIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\n\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\\n\\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum KsySchemaMetaXrefWikidata {
    WikidataIdentifier(WikidataIdentifier),
    Array(::std::vec::Vec<WikidataIdentifier>),
}
impl ::std::convert::From<&Self> for KsySchemaMetaXrefWikidata {
    fn from(value: &KsySchemaMetaXrefWikidata) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<WikidataIdentifier> for KsySchemaMetaXrefWikidata {
    fn from(value: WikidataIdentifier) -> Self {
        Self::WikidataIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<WikidataIdentifier>> for KsySchemaMetaXrefWikidata {
    fn from(value: ::std::vec::Vec<WikidataIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "`LocIdentifier`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^fdd\\\\d{6}$\","]
#[doc = "  \"$comment\": \"https://www.wikidata.org/wiki/Property:P3266#P1793\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct LocIdentifier(::std::string::String);
impl ::std::ops::Deref for LocIdentifier {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<LocIdentifier> for ::std::string::String {
    fn from(value: LocIdentifier) -> Self {
        value.0
    }
}
impl ::std::convert::From<&LocIdentifier> for LocIdentifier {
    fn from(value: &LocIdentifier) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for LocIdentifier {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^fdd\\d{6}$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^fdd\\d{6}$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for LocIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for LocIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for LocIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for LocIdentifier {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`MediaWikiPageName`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^([a-zA-Z0-9$\\\\-._~+!*'(),@&;:\\\\/]|%[0-9a-fA-F]{2})+$\","]
#[doc = "  \"$comment\": \"hand-crafted regex, it should match any valid URL path\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct MediaWikiPageName(::std::string::String);
impl ::std::ops::Deref for MediaWikiPageName {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<MediaWikiPageName> for ::std::string::String {
    fn from(value: MediaWikiPageName) -> Self {
        value.0
    }
}
impl ::std::convert::From<&MediaWikiPageName> for MediaWikiPageName {
    fn from(value: &MediaWikiPageName) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for MediaWikiPageName {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^([a-zA-Z0-9$\\-._~+!*'(),@&;:\\/]|%[0-9a-fA-F]{2})+$")
                    .unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err(
                "doesn't match pattern \"^([a-zA-Z0-9$\\-._~+!*'(),@&;:\\/]|%[0-9a-fA-F]{2})+$\""
                    .into(),
            );
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for MediaWikiPageName {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MediaWikiPageName {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MediaWikiPageName {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for MediaWikiPageName {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`MetaSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"properties\": {"]
#[doc = "    \"application\": {"]
#[doc = "      \"description\": \"applications that use this format and are typically associated with it\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"type\": \"string\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"bit-endian\": {"]
#[doc = "      \"description\": \"default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\\n\\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\\n\\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\\n\\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers\","]
#[doc = "      \"default\": \"be\","]
#[doc = "      \"enum\": ["]
#[doc = "        \"le\","]
#[doc = "        \"be\""]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"encoding\": {"]
#[doc = "      \"description\": \"default character encoding for string fields (of type `str` or `strz`) in the current type and its subtypes\","]
#[doc = "      \"$ref\": \"#/definitions/CharacterEncoding\""]
#[doc = "    },"]
#[doc = "    \"endian\": {"]
#[doc = "      \"description\": \"default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\\n\\napplies to the current type and its subtypes\\n\\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"enum\": ["]
#[doc = "            \"le\","]
#[doc = "            \"be\""]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"object\","]
#[doc = "          \"required\": ["]
#[doc = "            \"cases\","]
#[doc = "            \"switch-on\""]
#[doc = "          ],"]
#[doc = "          \"properties\": {"]
#[doc = "            \"cases\": {"]
#[doc = "              \"type\": \"object\","]
#[doc = "              \"patternProperties\": {"]
#[doc = "                \"^.*$\": {"]
#[doc = "                  \"enum\": ["]
#[doc = "                    \"le\","]
#[doc = "                    \"be\""]
#[doc = "                  ]"]
#[doc = "                }"]
#[doc = "              },"]
#[doc = "              \"additionalProperties\": false"]
#[doc = "            },"]
#[doc = "            \"switch-on\": {"]
#[doc = "              \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "            }"]
#[doc = "          },"]
#[doc = "          \"patternProperties\": {"]
#[doc = "            \"^-\": true"]
#[doc = "          },"]
#[doc = "          \"additionalProperties\": false"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"file-extension\": {"]
#[doc = "      \"description\": \"file extensions typically used for this format, without the leading dot and in lowercase letters\\n\\nshould be sorted from most popular to least popular\","]
#[doc = "      \"examples\": ["]
#[doc = "        \"exe\","]
#[doc = "        ["]
#[doc = "          \"jpg\","]
#[doc = "          \"jpeg\""]
#[doc = "        ]"]
#[doc = "      ],"]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"type\": \"string\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"id\": {"]
#[doc = "      \"description\": \"unique string that identifies this format\\n\\nshould be identical to the file name without the `.ksy` extension (e.g. `microsoft_pe` for `microsoft_pe.ksy`)\\n\\nused to derive the name of the top-level type when generating parsers\\n\\nrequired at the top level, shouldn't be used at nested levels\","]
#[doc = "      \"$ref\": \"#/definitions/Identifier\""]
#[doc = "    },"]
#[doc = "    \"imports\": {"]
#[doc = "      \"description\": \"list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\\n\\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\","]
#[doc = "          \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\","]
#[doc = "          \"$comment\": \"https://github.com/kaitai-io/kaitai_struct_tests/commit/85973798aa2ffda7008b2359eeb769a11bc90dad\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"type\": \"string\","]
#[doc = "            \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"ks-debug\": {"]
#[doc = "      \"description\": \"advise the Kaitai Struct Compiler (KSC) to use debug mode\","]
#[doc = "      \"default\": false,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"ks-opaque-types\": {"]
#[doc = "      \"description\": \"advise the Kaitai Struct Compiler (KSC) to ignore missing types in the .ksy file, and assume that these types are already provided externally by the environment the classes are generated for\","]
#[doc = "      \"default\": false,"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    },"]
#[doc = "    \"ks-version\": {"]
#[doc = "      \"description\": \"minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\\n\\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\\n\\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\","]
#[doc = "          \"pattern\": \"^(0\\\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\\\.(0|[1-9][0-9]*))(\\\\.(0|[1-9][0-9]*))?$\","]
#[doc = "          \"$comment\": \"See 1. https://github.com/kaitai-io/kaitai_struct_compiler/commit/aa10f0751e7e26fbb48afd1afc6a8a591268f4d9 2. https://github.com/kaitai-io/kaitai_struct_compiler/commit/df6463a65df8b78f85f7d37e2bb43a94e1622d68\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"number\","]
#[doc = "          \"not\": {"]
#[doc = "            \"enum\": ["]
#[doc = "              0.1,"]
#[doc = "              0.2,"]
#[doc = "              0.3,"]
#[doc = "              0.4,"]
#[doc = "              0.5"]
#[doc = "            ]"]
#[doc = "          },"]
#[doc = "          \"minimum\": 0.1"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"license\": {"]
#[doc = "      \"description\": \"license under which the KSY file is released\\n\\nrequired for all KSY specifications in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) (otherwise optional, but [highly recommended](https://choosealicense.com/no-permission/))\\n\\nmust be a valid [SPDX expression](https://spdx.github.io/spdx-spec/v3.0.1/annexes/spdx-license-expressions/) (however, a single license identifier from [this list](https://spdx.org/licenses/) is usually enough)\\n\\nto clarify, this is not a license of the original format description, but a license of the particular KSY implementation - if you're writing one, you can choose any open source license you want, regardless of what resources you use (as long as you only reproduce the idea and you don't copy long excerpts); we recommend [`CC0-1.0`](https://spdx.org/licenses/CC0-1.0.html) or [`MIT`](https://spdx.org/licenses/MIT.html)\\n\\ngenerated files from a KSY spec retain the same license as the original KSY\","]
#[doc = "      \"examples\": ["]
#[doc = "        \"CC0-1.0\","]
#[doc = "        \"MIT\""]
#[doc = "      ],"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    \"tags\": {"]
#[doc = "      \"description\": \"list of tags (categories/keywords) that can be assigned to the format\\n\\nused in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) to display formats at https://formats.kaitai.io/ also in categories other than the main one, which corresponds to the directory where the `.ksy` file is located\\n\\nshould match the directory names in https://github.com/kaitai-io/kaitai_struct_formats\\n\\nshould be written in `lower_snake_case` and sorted in alphabetical order\","]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    },"]
#[doc = "    \"title\": {"]
#[doc = "      \"description\": \"brief name of the format\","]
#[doc = "      \"examples\": ["]
#[doc = "        \"Windows PE executable\""]
#[doc = "      ],"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    \"xref\": {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"properties\": {"]
#[doc = "        \"forensicswiki\": {"]
#[doc = "          \"description\": \"article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\\n\\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"iso\": {"]
#[doc = "          \"description\": \"ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\\n\\nISO standards typically have clear designations like \\\"ISO/IEC 15948:2004\\\", so value should be citing everything except for \\\"ISO/IEC\\\", i.e. `15948:2004`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"justsolve\": {"]
#[doc = "          \"description\": \"article name at [\\\"Just Solve the File Format Problem\\\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\\n\\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"loc\": {"]
#[doc = "          \"description\": \"identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\\n\\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"mime\": {"]
#[doc = "          \"description\": \"MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\\n\\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\\n\\nvalue must specify full MIME type (both parts), e.g. `image/png`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/MimeType\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/MimeType\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"pronom\": {"]
#[doc = "          \"description\": \"format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"rfc\": {"]
#[doc = "          \"description\": \"reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \\\"Request for Comments\\\" documents maintained by ISOC (Internet Society)\\n\\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\\n\\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        \"wikidata\": {"]
#[doc = "          \"description\": \"item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\\n\\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`\","]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^.*$\": {"]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"array\","]
#[doc = "              \"items\": {"]
#[doc = "                \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "              }"]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct MetaSpec {
    #[doc = "applications that use this format and are typically associated with it"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub application: ::std::option::Option<MetaSpecApplication>,
    #[doc = "default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\n\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\n\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\n\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers"]
    #[serde(rename = "bit-endian", default = "defaults::meta_spec_bit_endian")]
    pub bit_endian: MetaSpecBitEndian,
    #[doc = "default character encoding for string fields (of type `str` or `strz`) in the current type and its subtypes"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub encoding: ::std::option::Option<CharacterEncoding>,
    #[doc = "default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\n\napplies to the current type and its subtypes\n\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub endian: ::std::option::Option<MetaSpecEndian>,
    #[doc = "file extensions typically used for this format, without the leading dot and in lowercase letters\n\nshould be sorted from most popular to least popular"]
    #[serde(
        rename = "file-extension",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub file_extension: ::std::option::Option<MetaSpecFileExtension>,
    #[doc = "unique string that identifies this format\n\nshould be identical to the file name without the `.ksy` extension (e.g. `microsoft_pe` for `microsoft_pe.ksy`)\n\nused to derive the name of the top-level type when generating parsers\n\nrequired at the top level, shouldn't be used at nested levels"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub id: ::std::option::Option<Identifier>,
    #[doc = "list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\n\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub imports: ::std::option::Option<MetaSpecImports>,
    #[doc = "advise the Kaitai Struct Compiler (KSC) to use debug mode"]
    #[serde(
        rename = "ks-debug",
        default = "defaults::default_bool::<false>",
        skip_serializing_if = "defaults::is_bool::<false>"
    )]
    pub ks_debug: bool,
    #[doc = "advise the Kaitai Struct Compiler (KSC) to ignore missing types in the .ksy file, and assume that these types are already provided externally by the environment the classes are generated for"]
    #[serde(
        rename = "ks-opaque-types",
        default = "defaults::default_bool::<false>",
        skip_serializing_if = "defaults::is_bool::<false>"
    )]
    pub ks_opaque_types: bool,
    #[doc = "minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\n\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\n\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)"]
    #[serde(
        rename = "ks-version",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub ks_version: ::std::option::Option<MetaSpecKsVersion>,
    #[doc = "license under which the KSY file is released\n\nrequired for all KSY specifications in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) (otherwise optional, but [highly recommended](https://choosealicense.com/no-permission/))\n\nmust be a valid [SPDX expression](https://spdx.github.io/spdx-spec/v3.0.1/annexes/spdx-license-expressions/) (however, a single license identifier from [this list](https://spdx.org/licenses/) is usually enough)\n\nto clarify, this is not a license of the original format description, but a license of the particular KSY implementation - if you're writing one, you can choose any open source license you want, regardless of what resources you use (as long as you only reproduce the idea and you don't copy long excerpts); we recommend [`CC0-1.0`](https://spdx.org/licenses/CC0-1.0.html) or [`MIT`](https://spdx.org/licenses/MIT.html)\n\ngenerated files from a KSY spec retain the same license as the original KSY"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub license: ::std::option::Option<::std::string::String>,
    #[doc = "list of tags (categories/keywords) that can be assigned to the format\n\nused in the [format gallery](https://github.com/kaitai-io/kaitai_struct_formats) to display formats at https://formats.kaitai.io/ also in categories other than the main one, which corresponds to the directory where the `.ksy` file is located\n\nshould match the directory names in https://github.com/kaitai-io/kaitai_struct_formats\n\nshould be written in `lower_snake_case` and sorted in alphabetical order"]
    #[serde(default, skip_serializing_if = "::std::vec::Vec::is_empty")]
    pub tags: ::std::vec::Vec<::std::string::String>,
    #[doc = "brief name of the format"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub title: ::std::option::Option<::std::string::String>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub xref: ::std::option::Option<MetaSpecXref>,
}
impl ::std::convert::From<&MetaSpec> for MetaSpec {
    fn from(value: &MetaSpec) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for MetaSpec {
    fn default() -> Self {
        Self {
            application: Default::default(),
            bit_endian: defaults::meta_spec_bit_endian(),
            encoding: Default::default(),
            endian: Default::default(),
            file_extension: Default::default(),
            id: Default::default(),
            imports: Default::default(),
            ks_debug: defaults::default_bool::<false>(),
            ks_opaque_types: defaults::default_bool::<false>(),
            ks_version: Default::default(),
            license: Default::default(),
            tags: Default::default(),
            title: Default::default(),
            xref: Default::default(),
        }
    }
}
#[doc = "applications that use this format and are typically associated with it"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"applications that use this format and are typically associated with it\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecApplication {
    String(::std::string::String),
    Array(::std::vec::Vec<::std::string::String>),
}
impl ::std::convert::From<&Self> for MetaSpecApplication {
    fn from(value: &MetaSpecApplication) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<::std::string::String>> for MetaSpecApplication {
    fn from(value: ::std::vec::Vec<::std::string::String>) -> Self {
        Self::Array(value)
    }
}
#[doc = "default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\n\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\n\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\n\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"default parsing direction (*bit endianness*) of bit-sized integers (built-in `bX` types)\\n\\nbig-endian (`be`) order is default, but it is recommended to specify it explicitly\\n\\ncan only have the literal value `le` or `be` (runtime switching [as with the `endian` key](https://doc.kaitai.io/user_guide.html#calc-endian) is not supported)\\n\\nfor more information, see https://doc.kaitai.io/user_guide.html#_bit_sized_integers\","]
#[doc = "  \"default\": \"be\","]
#[doc = "  \"enum\": ["]
#[doc = "    \"le\","]
#[doc = "    \"be\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum MetaSpecBitEndian {
    #[serde(rename = "le")]
    Le,
    #[serde(rename = "be")]
    Be,
}
impl ::std::convert::From<&Self> for MetaSpecBitEndian {
    fn from(value: &MetaSpecBitEndian) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for MetaSpecBitEndian {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Le => f.write_str("le"),
            Self::Be => f.write_str("be"),
        }
    }
}
impl ::std::str::FromStr for MetaSpecBitEndian {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "le" => Ok(Self::Le),
            "be" => Ok(Self::Be),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecBitEndian {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecBitEndian {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecBitEndian {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::default::Default for MetaSpecBitEndian {
    fn default() -> Self {
        MetaSpecBitEndian::Be
    }
}
#[doc = "default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\n\napplies to the current type and its subtypes\n\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"default endianness (byte order) of built-in multibyte numeric types, i.e. integers (`sX` and `uX`, where `X` is 2, 4 or 8) and floating-point numbers (`fX`, where `X` is 4 or 8)\\n\\napplies to the current type and its subtypes\\n\\nthis key is required if you use any `sX`, `uX` or `fX` types (other than `s1` and `u1`) without an explicit `le` or `be` suffix (as in `u2be` or `f4le`)\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"enum\": ["]
#[doc = "        \"le\","]
#[doc = "        \"be\""]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"cases\","]
#[doc = "        \"switch-on\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"cases\": {"]
#[doc = "          \"type\": \"object\","]
#[doc = "          \"patternProperties\": {"]
#[doc = "            \"^.*$\": {"]
#[doc = "              \"enum\": ["]
#[doc = "                \"le\","]
#[doc = "                \"be\""]
#[doc = "              ]"]
#[doc = "            }"]
#[doc = "          },"]
#[doc = "          \"additionalProperties\": false"]
#[doc = "        },"]
#[doc = "        \"switch-on\": {"]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged, deny_unknown_fields)]
pub enum MetaSpecEndian {
    Variant0(MetaSpecEndianVariant0),
    Variant1 {
        cases: indexmap::IndexMap<MetaSpecEndianVariant1CasesKey, MetaSpecEndianVariant1CasesValue>,
        #[serde(rename = "switch-on")]
        switch_on: AnyScalar,
    },
}
impl ::std::convert::From<&Self> for MetaSpecEndian {
    fn from(value: &MetaSpecEndian) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MetaSpecEndianVariant0> for MetaSpecEndian {
    fn from(value: MetaSpecEndianVariant0) -> Self {
        Self::Variant0(value)
    }
}
#[doc = "`MetaSpecEndianVariant0`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"enum\": ["]
#[doc = "    \"le\","]
#[doc = "    \"be\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum MetaSpecEndianVariant0 {
    #[serde(rename = "le")]
    Le,
    #[serde(rename = "be")]
    Be,
}
impl ::std::convert::From<&Self> for MetaSpecEndianVariant0 {
    fn from(value: &MetaSpecEndianVariant0) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for MetaSpecEndianVariant0 {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Le => f.write_str("le"),
            Self::Be => f.write_str("be"),
        }
    }
}
impl ::std::str::FromStr for MetaSpecEndianVariant0 {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "le" => Ok(Self::Le),
            "be" => Ok(Self::Be),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecEndianVariant0 {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecEndianVariant0 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecEndianVariant0 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
#[doc = "`MetaSpecEndianVariant1CasesKey`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^.*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct MetaSpecEndianVariant1CasesKey(::std::string::String);
impl ::std::ops::Deref for MetaSpecEndianVariant1CasesKey {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<MetaSpecEndianVariant1CasesKey> for ::std::string::String {
    fn from(value: MetaSpecEndianVariant1CasesKey) -> Self {
        value.0
    }
}
impl ::std::convert::From<&MetaSpecEndianVariant1CasesKey> for MetaSpecEndianVariant1CasesKey {
    fn from(value: &MetaSpecEndianVariant1CasesKey) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for MetaSpecEndianVariant1CasesKey {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^.*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^.*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecEndianVariant1CasesKey {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecEndianVariant1CasesKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecEndianVariant1CasesKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for MetaSpecEndianVariant1CasesKey {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`MetaSpecEndianVariant1CasesValue`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"enum\": ["]
#[doc = "    \"le\","]
#[doc = "    \"be\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum MetaSpecEndianVariant1CasesValue {
    #[serde(rename = "le")]
    Le,
    #[serde(rename = "be")]
    Be,
}
impl ::std::convert::From<&Self> for MetaSpecEndianVariant1CasesValue {
    fn from(value: &MetaSpecEndianVariant1CasesValue) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for MetaSpecEndianVariant1CasesValue {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::Le => f.write_str("le"),
            Self::Be => f.write_str("be"),
        }
    }
}
impl ::std::str::FromStr for MetaSpecEndianVariant1CasesValue {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "le" => Ok(Self::Le),
            "be" => Ok(Self::Be),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecEndianVariant1CasesValue {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecEndianVariant1CasesValue {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecEndianVariant1CasesValue {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
#[doc = "file extensions typically used for this format, without the leading dot and in lowercase letters\n\nshould be sorted from most popular to least popular"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"file extensions typically used for this format, without the leading dot and in lowercase letters\\n\\nshould be sorted from most popular to least popular\","]
#[doc = "  \"examples\": ["]
#[doc = "    \"exe\","]
#[doc = "    ["]
#[doc = "      \"jpg\","]
#[doc = "      \"jpeg\""]
#[doc = "    ]"]
#[doc = "  ],"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecFileExtension {
    String(::std::string::String),
    Array(::std::vec::Vec<::std::string::String>),
}
impl ::std::convert::From<&Self> for MetaSpecFileExtension {
    fn from(value: &MetaSpecFileExtension) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<::std::string::String>> for MetaSpecFileExtension {
    fn from(value: ::std::vec::Vec<::std::string::String>) -> Self {
        Self::Array(value)
    }
}
#[doc = "list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\n\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"list of relative or absolute paths to another `.ksy` files to import (**without** the `.ksy` extension)\\n\\nthe top-level type of the imported file will be accessible in the current spec under the name specified in the top-level `/meta/id` of the imported file\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\","]
#[doc = "      \"$comment\": \"https://github.com/kaitai-io/kaitai_struct_tests/commit/85973798aa2ffda7008b2359eeb769a11bc90dad\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"type\": \"string\","]
#[doc = "        \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecImports {
    String(MetaSpecImportsString),
    Array(::std::vec::Vec<MetaSpecImportsArrayItem>),
}
impl ::std::convert::From<&Self> for MetaSpecImports {
    fn from(value: &MetaSpecImports) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MetaSpecImportsString> for MetaSpecImports {
    fn from(value: MetaSpecImportsString) -> Self {
        Self::String(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<MetaSpecImportsArrayItem>> for MetaSpecImports {
    fn from(value: ::std::vec::Vec<MetaSpecImportsArrayItem>) -> Self {
        Self::Array(value)
    }
}
#[doc = "`MetaSpecImportsArrayItem`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct MetaSpecImportsArrayItem(::std::string::String);
impl ::std::ops::Deref for MetaSpecImportsArrayItem {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<MetaSpecImportsArrayItem> for ::std::string::String {
    fn from(value: MetaSpecImportsArrayItem) -> Self {
        value.0
    }
}
impl ::std::convert::From<&MetaSpecImportsArrayItem> for MetaSpecImportsArrayItem {
    fn from(value: &MetaSpecImportsArrayItem) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for MetaSpecImportsArrayItem {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^(.*/)?[a-z][a-z0-9_]*$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^(.*/)?[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecImportsArrayItem {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecImportsArrayItem {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecImportsArrayItem {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for MetaSpecImportsArrayItem {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`MetaSpecImportsString`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(.*/)?[a-z][a-z0-9_]*$\","]
#[doc = "  \"$comment\": \"https://github.com/kaitai-io/kaitai_struct_tests/commit/85973798aa2ffda7008b2359eeb769a11bc90dad\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct MetaSpecImportsString(::std::string::String);
impl ::std::ops::Deref for MetaSpecImportsString {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<MetaSpecImportsString> for ::std::string::String {
    fn from(value: MetaSpecImportsString) -> Self {
        value.0
    }
}
impl ::std::convert::From<&MetaSpecImportsString> for MetaSpecImportsString {
    fn from(value: &MetaSpecImportsString) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for MetaSpecImportsString {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^(.*/)?[a-z][a-z0-9_]*$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^(.*/)?[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecImportsString {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecImportsString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecImportsString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for MetaSpecImportsString {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\n\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\n\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"minimum Kaitai Struct compiler (KSC) version required to compile this .ksy file (older versions will refuse to compile and inform the user that they need at least the specified version)\\n\\nonly versions 0.6 or higher are accepted (KSC 0.6 was the first to support `ks-version`, so there is no point in entering any lower version)\\n\\nthe value must be sometimes enclosed in quotes to ensure correct interpretation, for example `ks-version: '0.10'` (without the quotes it is parsed as a float in YAML and gets interpreted as 0.1, which will be rejected)\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^(0\\\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\\\.(0|[1-9][0-9]*))(\\\\.(0|[1-9][0-9]*))?$\","]
#[doc = "      \"$comment\": \"See 1. https://github.com/kaitai-io/kaitai_struct_compiler/commit/aa10f0751e7e26fbb48afd1afc6a8a591268f4d9 2. https://github.com/kaitai-io/kaitai_struct_compiler/commit/df6463a65df8b78f85f7d37e2bb43a94e1622d68\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"number\","]
#[doc = "      \"not\": {"]
#[doc = "        \"enum\": ["]
#[doc = "          0.1,"]
#[doc = "          0.2,"]
#[doc = "          0.3,"]
#[doc = "          0.4,"]
#[doc = "          0.5"]
#[doc = "        ]"]
#[doc = "      },"]
#[doc = "      \"minimum\": 0.1"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecKsVersion {
    String(MetaSpecKsVersionString),
    Number(f64),
}
impl ::std::convert::From<&Self> for MetaSpecKsVersion {
    fn from(value: &MetaSpecKsVersion) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for MetaSpecKsVersion {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        if let Ok(v) = value.parse() {
            Ok(Self::String(v))
        } else if let Ok(v) = value.parse() {
            Ok(Self::Number(v))
        } else {
            Err("string conversion failed for all variants".into())
        }
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecKsVersion {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecKsVersion {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecKsVersion {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::fmt::Display for MetaSpecKsVersion {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::String(x) => x.fmt(f),
            Self::Number(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<MetaSpecKsVersionString> for MetaSpecKsVersion {
    fn from(value: MetaSpecKsVersionString) -> Self {
        Self::String(value)
    }
}
impl ::std::convert::From<f64> for MetaSpecKsVersion {
    fn from(value: f64) -> Self {
        Self::Number(value)
    }
}
#[doc = "`MetaSpecKsVersionString`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(0\\\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\\\.(0|[1-9][0-9]*))(\\\\.(0|[1-9][0-9]*))?$\","]
#[doc = "  \"$comment\": \"See 1. https://github.com/kaitai-io/kaitai_struct_compiler/commit/aa10f0751e7e26fbb48afd1afc6a8a591268f4d9 2. https://github.com/kaitai-io/kaitai_struct_compiler/commit/df6463a65df8b78f85f7d37e2bb43a94e1622d68\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct MetaSpecKsVersionString(::std::string::String);
impl ::std::ops::Deref for MetaSpecKsVersionString {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<MetaSpecKsVersionString> for ::std::string::String {
    fn from(value: MetaSpecKsVersionString) -> Self {
        value.0
    }
}
impl ::std::convert::From<&MetaSpecKsVersionString> for MetaSpecKsVersionString {
    fn from(value: &MetaSpecKsVersionString) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for MetaSpecKsVersionString {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> = ::std::sync::LazyLock::new(
            || {
                :: regress :: Regex :: new ("^(0\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\.(0|[1-9][0-9]*))(\\.(0|[1-9][0-9]*))?$") . unwrap ()
            },
        );
        if PATTERN.find(value).is_none() {
            return Err ("doesn't match pattern \"^(0\\.([1-5][0-9]+|[6-9][0-9]*)|([1-9][0-9]*)\\.(0|[1-9][0-9]*))(\\.(0|[1-9][0-9]*))?$\"" . into ()) ;
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for MetaSpecKsVersionString {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MetaSpecKsVersionString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MetaSpecKsVersionString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for MetaSpecKsVersionString {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`MetaSpecXref`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"properties\": {"]
#[doc = "    \"forensicswiki\": {"]
#[doc = "      \"description\": \"article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\\n\\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"iso\": {"]
#[doc = "      \"description\": \"ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\\n\\nISO standards typically have clear designations like \\\"ISO/IEC 15948:2004\\\", so value should be citing everything except for \\\"ISO/IEC\\\", i.e. `15948:2004`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"justsolve\": {"]
#[doc = "      \"description\": \"article name at [\\\"Just Solve the File Format Problem\\\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\\n\\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"loc\": {"]
#[doc = "      \"description\": \"identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\\n\\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"mime\": {"]
#[doc = "      \"description\": \"MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\\n\\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\\n\\nvalue must specify full MIME type (both parts), e.g. `image/png`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/MimeType\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/MimeType\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"pronom\": {"]
#[doc = "      \"description\": \"format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"rfc\": {"]
#[doc = "      \"description\": \"reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \\\"Request for Comments\\\" documents maintained by ISOC (Internet Society)\\n\\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\\n\\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"wikidata\": {"]
#[doc = "      \"description\": \"item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\\n\\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^.*$\": {"]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct MetaSpecXref {
    #[doc = "article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\n\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub forensicswiki: ::std::option::Option<MetaSpecXrefForensicswiki>,
    #[doc = "ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\n\nISO standards typically have clear designations like \"ISO/IEC 15948:2004\", so value should be citing everything except for \"ISO/IEC\", i.e. `15948:2004`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub iso: ::std::option::Option<MetaSpecXrefIso>,
    #[doc = "article name at [\"Just Solve the File Format Problem\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\n\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub justsolve: ::std::option::Option<MetaSpecXrefJustsolve>,
    #[doc = "identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\n\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub loc: ::std::option::Option<MetaSpecXrefLoc>,
    #[doc = "MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\n\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\n\nvalue must specify full MIME type (both parts), e.g. `image/png`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub mime: ::std::option::Option<MetaSpecXrefMime>,
    #[doc = "format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub pronom: ::std::option::Option<MetaSpecXrefPronom>,
    #[doc = "reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \"Request for Comments\" documents maintained by ISOC (Internet Society)\n\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\n\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub rfc: ::std::option::Option<MetaSpecXrefRfc>,
    #[doc = "item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\n\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`"]
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub wikidata: ::std::option::Option<MetaSpecXrefWikidata>,
}
impl ::std::convert::From<&MetaSpecXref> for MetaSpecXref {
    fn from(value: &MetaSpecXref) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for MetaSpecXref {
    fn default() -> Self {
        Self {
            forensicswiki: Default::default(),
            iso: Default::default(),
            justsolve: Default::default(),
            loc: Default::default(),
            mime: Default::default(),
            pronom: Default::default(),
            rfc: Default::default(),
            wikidata: Default::default(),
        }
    }
}
#[doc = "article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\n\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"article name at [Forensics Wiki](https://forensics.wiki/), which is a CC-BY-SA-licensed wiki with information on digital forensics, file formats and tools\\n\\nfull link name could be generated as `https://forensics.wiki/` + this value + `/`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefForensicswiki {
    MediaWikiPageName(MediaWikiPageName),
    Array(::std::vec::Vec<MediaWikiPageName>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefForensicswiki {
    fn from(value: &MetaSpecXrefForensicswiki) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MediaWikiPageName> for MetaSpecXrefForensicswiki {
    fn from(value: MediaWikiPageName) -> Self {
        Self::MediaWikiPageName(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<MediaWikiPageName>> for MetaSpecXrefForensicswiki {
    fn from(value: ::std::vec::Vec<MediaWikiPageName>) -> Self {
        Self::Array(value)
    }
}
#[doc = "ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\n\nISO standards typically have clear designations like \"ISO/IEC 15948:2004\", so value should be citing everything except for \"ISO/IEC\", i.e. `15948:2004`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"ISO/IEC standard number, reference to a standard accepted and published by [ISO](https://www.iso.org/) (International Organization for Standardization).\\n\\nISO standards typically have clear designations like \\\"ISO/IEC 15948:2004\\\", so value should be citing everything except for \\\"ISO/IEC\\\", i.e. `15948:2004`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/IsoIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefIso {
    IsoIdentifier(IsoIdentifier),
    Array(::std::vec::Vec<IsoIdentifier>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefIso {
    fn from(value: &MetaSpecXrefIso) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<IsoIdentifier> for MetaSpecXrefIso {
    fn from(value: IsoIdentifier) -> Self {
        Self::IsoIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<IsoIdentifier>> for MetaSpecXrefIso {
    fn from(value: ::std::vec::Vec<IsoIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "article name at [\"Just Solve the File Format Problem\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\n\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"article name at [\\\"Just Solve the File Format Problem\\\" wiki](http://fileformats.archiveteam.org/wiki/Main_Page), a wiki that collects information on many file formats\\n\\nfull link name could be generated as `http://fileformats.archiveteam.org/wiki/` + this value\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/MediaWikiPageName\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefJustsolve {
    MediaWikiPageName(MediaWikiPageName),
    Array(::std::vec::Vec<MediaWikiPageName>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefJustsolve {
    fn from(value: &MetaSpecXrefJustsolve) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MediaWikiPageName> for MetaSpecXrefJustsolve {
    fn from(value: MediaWikiPageName) -> Self {
        Self::MediaWikiPageName(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<MediaWikiPageName>> for MetaSpecXrefJustsolve {
    fn from(value: ::std::vec::Vec<MediaWikiPageName>) -> Self {
        Self::Array(value)
    }
}
#[doc = "identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\n\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"identifier in [Digital Formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml) database of [US Library of Congress](https://www.loc.gov/)\\n\\nvalue typically looks like `fddXXXXXX`, where `XXXXXX` is a 6-digit identifier\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/LocIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefLoc {
    LocIdentifier(LocIdentifier),
    Array(::std::vec::Vec<LocIdentifier>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefLoc {
    fn from(value: &MetaSpecXrefLoc) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<LocIdentifier> for MetaSpecXrefLoc {
    fn from(value: LocIdentifier) -> Self {
        Self::LocIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<LocIdentifier>> for MetaSpecXrefLoc {
    fn from(value: ::std::vec::Vec<LocIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\n\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\n\nvalue must specify full MIME type (both parts), e.g. `image/png`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"MIME type (IANA media type), a string typically used in various Internet protocols to specify format of binary payload\\n\\nthere is a [central registry of media types](https://www.iana.org/assignments/media-types/media-types.xhtml) managed by IANA\\n\\nvalue must specify full MIME type (both parts), e.g. `image/png`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/MimeType\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/MimeType\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefMime {
    MimeType(MimeType),
    Array(::std::vec::Vec<MimeType>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefMime {
    fn from(value: &MetaSpecXrefMime) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<MimeType> for MetaSpecXrefMime {
    fn from(value: MimeType) -> Self {
        Self::MimeType(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<MimeType>> for MetaSpecXrefMime {
    fn from(value: ::std::vec::Vec<MimeType>) -> Self {
        Self::Array(value)
    }
}
#[doc = "format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"format identifier in [PRONOM Technical Registry](https://www.nationalarchives.gov.uk/PRONOM/BasicSearch/proBasicSearch.aspx?status=new) of [UK National Archives](https://www.nationalarchives.gov.uk/), which is a massive file formats database that catalogues many file formats for digital preservation purposes\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/PronomIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefPronom {
    PronomIdentifier(PronomIdentifier),
    Array(::std::vec::Vec<PronomIdentifier>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefPronom {
    fn from(value: &MetaSpecXrefPronom) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<PronomIdentifier> for MetaSpecXrefPronom {
    fn from(value: PronomIdentifier) -> Self {
        Self::PronomIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<PronomIdentifier>> for MetaSpecXrefPronom {
    fn from(value: ::std::vec::Vec<PronomIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \"Request for Comments\" documents maintained by ISOC (Internet Society)\n\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\n\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"reference to [RFC](https://en.wikipedia.org/wiki/Request_for_Comments), \\\"Request for Comments\\\" documents maintained by ISOC (Internet Society)\\n\\nRFCs are typically treated as global, Internet-wide standards, and, for example, many networking / interoperability protocols are specified in RFCs\\n\\nvalue should be just raw RFC number, without any prefixes, e.g. `1234`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/RfcIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefRfc {
    RfcIdentifier(RfcIdentifier),
    Array(::std::vec::Vec<RfcIdentifier>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefRfc {
    fn from(value: &MetaSpecXrefRfc) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<RfcIdentifier> for MetaSpecXrefRfc {
    fn from(value: RfcIdentifier) -> Self {
        Self::RfcIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<RfcIdentifier>> for MetaSpecXrefRfc {
    fn from(value: ::std::vec::Vec<RfcIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\n\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"item identifier at [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), a global knowledge base\\n\\nvalue typically follows `Qxxx` pattern, where `xxx` is a number generated by [Wikidata](https://www.wikidata.org/wiki/Wikidata:Main_Page), e.g. `Q535473`\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/WikidataIdentifier\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum MetaSpecXrefWikidata {
    WikidataIdentifier(WikidataIdentifier),
    Array(::std::vec::Vec<WikidataIdentifier>),
}
impl ::std::convert::From<&Self> for MetaSpecXrefWikidata {
    fn from(value: &MetaSpecXrefWikidata) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<WikidataIdentifier> for MetaSpecXrefWikidata {
    fn from(value: WikidataIdentifier) -> Self {
        Self::WikidataIdentifier(value)
    }
}
impl ::std::convert::From<::std::vec::Vec<WikidataIdentifier>> for MetaSpecXrefWikidata {
    fn from(value: ::std::vec::Vec<WikidataIdentifier>) -> Self {
        Self::Array(value)
    }
}
#[doc = "`MimeType`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(application|audio|font|image|model|text|video)/([a-zA-Z0-9]+[.\\\\-_+])*[a-zA-Z0-9]+[.\\\\-_+]?$\","]
#[doc = "  \"$comment\": \"this regex pattern is hand-crafted and not coming from any specification, but it's tested against all registered discrete IANA media types (composite types don't make sense for Kaitai Struct)\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct MimeType(::std::string::String);
impl ::std::ops::Deref for MimeType {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<MimeType> for ::std::string::String {
    fn from(value: MimeType) -> Self {
        value.0
    }
}
impl ::std::convert::From<&MimeType> for MimeType {
    fn from(value: &MimeType) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for MimeType {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> = ::std::sync::LazyLock::new(
            || {
                :: regress :: Regex :: new ("^(application|audio|font|image|model|text|video)/([a-zA-Z0-9]+[.\\-_+])*[a-zA-Z0-9]+[.\\-_+]?$") . unwrap ()
            },
        );
        if PATTERN.find(value).is_none() {
            return Err ("doesn't match pattern \"^(application|audio|font|image|model|text|video)/([a-zA-Z0-9]+[.\\-_+])*[a-zA-Z0-9]+[.\\-_+]?$\"" . into ()) ;
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for MimeType {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for MimeType {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for MimeType {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for MimeType {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`ParamSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"required\": ["]
#[doc = "    \"id\""]
#[doc = "  ],"]
#[doc = "  \"properties\": {"]
#[doc = "    \"doc\": {"]
#[doc = "      \"$ref\": \"#/definitions/Doc\""]
#[doc = "    },"]
#[doc = "    \"doc-ref\": {"]
#[doc = "      \"$ref\": \"#/definitions/DocRef\""]
#[doc = "    },"]
#[doc = "    \"enum\": {"]
#[doc = "      \"description\": \"path to an enum type (defined in the `enums` map), which will become the type of the parameter\\n\\nonly integer-based enums are supported, so `type` must be an integer type (`type: uX`, `type: sX` or `type: bX`) for this property to work\\n\\nyou can use `enum` with `type: b1` as well: `b1` means a 1-bit **integer** (0 or 1) when used with `enum` (**not** a boolean)\\n\\none can reference an enum type of a subtype by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_enum`)\","]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$\""]
#[doc = "    },"]
#[doc = "    \"id\": {"]
#[doc = "      \"allOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\","]
#[doc = "          \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"not\": {"]
#[doc = "            \"enum\": ["]
#[doc = "              \"true\","]
#[doc = "              \"false\","]
#[doc = "              \"null\""]
#[doc = "            ]"]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    \"type\": {"]
#[doc = "      \"description\": \"specifies \\\"pure\\\" type of the parameter, without any serialization details (like endianness, sizes, encodings)\\n\\n| Value                  | Description\\n|-\\n| `u1`, `u2`, `u4`, `u8` | unsigned integer\\n| `s1`, `s2`, `s4`, `s8` | signed integer\\n| `bX`                   | bit-sized integer (if `X` != 1)\\n| `f4`, `f8`             | floating point number\\n| `type` key missing<br>or `bytes` | byte array\\n| `str`                  | string\\n| `bool` (or `b1`)       | boolean\\n| `struct`               | arbitrary KaitaiStruct-compatible user type\\n| `io`                   | KaitaiStream-compatible IO stream\\n| `any`                  | allow any type (if target language supports that)\\n| other identifier       | user-defined type, without parameters<br>a nested type can be referenced with double colon (e.g. `type: 'foo::bar'`)\\n\\none can specify arrays by appending `[]` after the type identifier (e.g. `type: u2[]`, `type: 'foo::bar[]'`, `type: struct[]` etc.)\","]
#[doc = "      \"type\": \"string\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct ParamSpec {
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub doc: ::std::option::Option<Doc>,
    #[serde(
        rename = "doc-ref",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub doc_ref: ::std::option::Option<DocRef>,
    #[doc = "path to an enum type (defined in the `enums` map), which will become the type of the parameter\n\nonly integer-based enums are supported, so `type` must be an integer type (`type: uX`, `type: sX` or `type: bX`) for this property to work\n\nyou can use `enum` with `type: b1` as well: `b1` means a 1-bit **integer** (0 or 1) when used with `enum` (**not** a boolean)\n\none can reference an enum type of a subtype by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_enum`)"]
    #[serde(
        rename = "enum",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub enum_: ::std::option::Option<ParamSpecEnum>,
    pub id: ParamSpecId,
    #[doc = "specifies \"pure\" type of the parameter, without any serialization details (like endianness, sizes, encodings)\n\n| Value                  | Description\n|-\n| `u1`, `u2`, `u4`, `u8` | unsigned integer\n| `s1`, `s2`, `s4`, `s8` | signed integer\n| `bX`                   | bit-sized integer (if `X` != 1)\n| `f4`, `f8`             | floating point number\n| `type` key missing<br>or `bytes` | byte array\n| `str`                  | string\n| `bool` (or `b1`)       | boolean\n| `struct`               | arbitrary KaitaiStruct-compatible user type\n| `io`                   | KaitaiStream-compatible IO stream\n| `any`                  | allow any type (if target language supports that)\n| other identifier       | user-defined type, without parameters<br>a nested type can be referenced with double colon (e.g. `type: 'foo::bar'`)\n\none can specify arrays by appending `[]` after the type identifier (e.g. `type: u2[]`, `type: 'foo::bar[]'`, `type: struct[]` etc.)"]
    #[serde(
        rename = "type",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub type_: ::std::option::Option<::std::string::String>,
}
impl ::std::convert::From<&ParamSpec> for ParamSpec {
    fn from(value: &ParamSpec) -> Self {
        value.clone()
    }
}
#[doc = "path to an enum type (defined in the `enums` map), which will become the type of the parameter\n\nonly integer-based enums are supported, so `type` must be an integer type (`type: uX`, `type: sX` or `type: bX`) for this property to work\n\nyou can use `enum` with `type: b1` as well: `b1` means a 1-bit **integer** (0 or 1) when used with `enum` (**not** a boolean)\n\none can reference an enum type of a subtype by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_enum`)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"path to an enum type (defined in the `enums` map), which will become the type of the parameter\\n\\nonly integer-based enums are supported, so `type` must be an integer type (`type: uX`, `type: sX` or `type: bX`) for this property to work\\n\\nyou can use `enum` with `type: b1` as well: `b1` means a 1-bit **integer** (0 or 1) when used with `enum` (**not** a boolean)\\n\\none can reference an enum type of a subtype by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_enum`)\","]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct ParamSpecEnum(::std::string::String);
impl ::std::ops::Deref for ParamSpecEnum {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<ParamSpecEnum> for ::std::string::String {
    fn from(value: ParamSpecEnum) -> Self {
        value.0
    }
}
impl ::std::convert::From<&ParamSpecEnum> for ParamSpecEnum {
    fn from(value: &ParamSpecEnum) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for ParamSpecEnum {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new("^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$").unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^([a-z][a-z0-9_]*::)*[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for ParamSpecEnum {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for ParamSpecEnum {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for ParamSpecEnum {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for ParamSpecEnum {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`ParamSpecId`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"allOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"not\": {"]
#[doc = "        \"enum\": ["]
#[doc = "          \"true\","]
#[doc = "          \"false\","]
#[doc = "          \"null\""]
#[doc = "        ]"]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct ParamSpecId(::std::string::String);
impl ::std::ops::Deref for ParamSpecId {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<ParamSpecId> for ::std::string::String {
    fn from(value: ParamSpecId) -> Self {
        value.0
    }
}
impl ::std::convert::From<&ParamSpecId> for ParamSpecId {
    fn from(value: &ParamSpecId) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for ParamSpecId {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^[a-z][a-z0-9_]*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for ParamSpecId {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for ParamSpecId {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for ParamSpecId {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for ParamSpecId {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`ParamsSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"array\","]
#[doc = "  \"items\": {"]
#[doc = "    \"$ref\": \"#/definitions/ParamSpec\""]
#[doc = "  }"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(transparent)]
pub struct ParamsSpec(pub ::std::vec::Vec<ParamSpec>);
impl ::std::ops::Deref for ParamsSpec {
    type Target = ::std::vec::Vec<ParamSpec>;
    fn deref(&self) -> &::std::vec::Vec<ParamSpec> {
        &self.0
    }
}
impl ::std::convert::From<ParamsSpec> for ::std::vec::Vec<ParamSpec> {
    fn from(value: ParamsSpec) -> Self {
        value.0
    }
}
impl ::std::convert::From<&ParamsSpec> for ParamsSpec {
    fn from(value: &ParamsSpec) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::vec::Vec<ParamSpec>> for ParamsSpec {
    fn from(value: ::std::vec::Vec<ParamSpec>) -> Self {
        Self(value)
    }
}
#[doc = "`PronomIdentifier`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^(x-)?fmt/\\\\d+$\","]
#[doc = "  \"$comment\": \"https://www.wikidata.org/wiki/Property:P2748#P1793\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct PronomIdentifier(::std::string::String);
impl ::std::ops::Deref for PronomIdentifier {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<PronomIdentifier> for ::std::string::String {
    fn from(value: PronomIdentifier) -> Self {
        value.0
    }
}
impl ::std::convert::From<&PronomIdentifier> for PronomIdentifier {
    fn from(value: &PronomIdentifier) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for PronomIdentifier {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^(x-)?fmt/\\d+$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^(x-)?fmt/\\d+$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for PronomIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for PronomIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for PronomIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for PronomIdentifier {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`RfcIdentifier`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"integer\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^[1-9]\\\\d*$\","]
#[doc = "      \"$comment\": \"https://www.wikidata.org/wiki/Property:P892#P1793\""]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum RfcIdentifier {
    Integer(i64),
    String(RfcIdentifierString),
}
impl ::std::convert::From<&Self> for RfcIdentifier {
    fn from(value: &RfcIdentifier) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for RfcIdentifier {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        if let Ok(v) = value.parse() {
            Ok(Self::Integer(v))
        } else if let Ok(v) = value.parse() {
            Ok(Self::String(v))
        } else {
            Err("string conversion failed for all variants".into())
        }
    }
}
impl ::std::convert::TryFrom<&str> for RfcIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for RfcIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for RfcIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::fmt::Display for RfcIdentifier {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::Integer(x) => x.fmt(f),
            Self::String(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<i64> for RfcIdentifier {
    fn from(value: i64) -> Self {
        Self::Integer(value)
    }
}
impl ::std::convert::From<RfcIdentifierString> for RfcIdentifier {
    fn from(value: RfcIdentifierString) -> Self {
        Self::String(value)
    }
}
#[doc = "`RfcIdentifierString`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^[1-9]\\\\d*$\","]
#[doc = "  \"$comment\": \"https://www.wikidata.org/wiki/Property:P892#P1793\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct RfcIdentifierString(::std::string::String);
impl ::std::ops::Deref for RfcIdentifierString {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<RfcIdentifierString> for ::std::string::String {
    fn from(value: RfcIdentifierString) -> Self {
        value.0
    }
}
impl ::std::convert::From<&RfcIdentifierString> for RfcIdentifierString {
    fn from(value: &RfcIdentifierString) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for RfcIdentifierString {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^[1-9]\\d*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[1-9]\\d*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for RfcIdentifierString {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for RfcIdentifierString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for RfcIdentifierString {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for RfcIdentifierString {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`StringOrInteger`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"integer\""]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum StringOrInteger {
    String(::std::string::String),
    Integer(i64),
}
impl ::std::convert::From<&Self> for StringOrInteger {
    fn from(value: &StringOrInteger) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for StringOrInteger {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::String(x) => x.fmt(f),
            Self::Integer(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<i64> for StringOrInteger {
    fn from(value: i64) -> Self {
        Self::Integer(value)
    }
}
#[doc = "expression that provides a human-readable string representation of an object of this user-defined type for debugging purposes\n\nit will be used to override the standard method for converting an object to a string called `toString()` (or similar) in most target languages, `__str__()` in Python and `to_s` in Ruby; in Rust, it is the `Display` trait"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"expression that provides a human-readable string representation of an object of this user-defined type for debugging purposes\\n\\nit will be used to override the standard method for converting an object to a string called `toString()` (or similar) in most target languages, `__str__()` in Python and `to_s` in Ruby; in Rust, it is the `Display` trait\","]
#[doc = "  \"examples\": ["]
#[doc = "    \"f\\\"{file_name} ({file_size} bytes)\\\"\","]
#[doc = "    \"file_name + \\\" (\\\" + file_size.to_s + \\\" bytes)\\\"\""]
#[doc = "  ],"]
#[doc = "  \"type\": \"string\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
#[serde(transparent)]
pub struct ToString(pub ::std::string::String);
impl ::std::ops::Deref for ToString {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<ToString> for ::std::string::String {
    fn from(value: ToString) -> Self {
        value.0
    }
}
impl ::std::convert::From<&ToString> for ToString {
    fn from(value: &ToString) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<::std::string::String> for ToString {
    fn from(value: ::std::string::String) -> Self {
        Self(value)
    }
}
impl ::std::str::FromStr for ToString {
    type Err = ::std::convert::Infallible;
    fn from_str(value: &str) -> ::std::result::Result<Self, Self::Err> {
        Ok(Self(value.to_string()))
    }
}
impl ::std::fmt::Display for ToString {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        self.0.fmt(f)
    }
}
#[doc = "`TypeRef`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"description\": \"name of or path to existing type name\\n\\nif name is single path element, then type resolved in such order:\\n- from subtypes of current type\\n- current type (so, recursive types is possible)\\n- parent type\\n\\none can reference a nested user-defined type by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_type`)\","]
#[doc = "      \"type\": \"string\","]
#[doc = "      \"pattern\": \"^\\\\s*([a-z][a-z0-9_]*\\\\s*::\\\\s*)*[a-z][a-z0-9_]*\\\\s*(\\\\([\\\\s\\\\S]+\\\\)\\\\s*)?$\","]
#[doc = "      \"$comment\": \"whitespace characters between tokens are allowed since version 0.10, see https://github.com/kaitai-io/kaitai_struct/issues/792\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"enum\": ["]
#[doc = "        \"u1\","]
#[doc = "        \"u2\","]
#[doc = "        \"u2le\","]
#[doc = "        \"u2be\","]
#[doc = "        \"u4\","]
#[doc = "        \"u4le\","]
#[doc = "        \"u4be\","]
#[doc = "        \"u8\","]
#[doc = "        \"u8le\","]
#[doc = "        \"u8be\","]
#[doc = "        \"s1\","]
#[doc = "        \"s2\","]
#[doc = "        \"s2le\","]
#[doc = "        \"s2be\","]
#[doc = "        \"s4\","]
#[doc = "        \"s4le\","]
#[doc = "        \"s4be\","]
#[doc = "        \"s8\","]
#[doc = "        \"s8le\","]
#[doc = "        \"s8be\","]
#[doc = "        \"f4\","]
#[doc = "        \"f4be\","]
#[doc = "        \"f4le\","]
#[doc = "        \"f8\","]
#[doc = "        \"f8be\","]
#[doc = "        \"f8le\","]
#[doc = "        \"str\","]
#[doc = "        \"strz\""]
#[doc = "      ]"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
pub struct TypeRef {
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_0: ::std::option::Option<TypeRefSubtype0>,
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_1: ::std::option::Option<TypeRefSubtype1>,
}
impl ::std::convert::From<&TypeRef> for TypeRef {
    fn from(value: &TypeRef) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for TypeRef {
    fn default() -> Self {
        Self {
            subtype_0: Default::default(),
            subtype_1: Default::default(),
        }
    }
}
#[doc = "name of or path to existing type name\n\nif name is single path element, then type resolved in such order:\n- from subtypes of current type\n- current type (so, recursive types is possible)\n- parent type\n\none can reference a nested user-defined type by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_type`)"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"name of or path to existing type name\\n\\nif name is single path element, then type resolved in such order:\\n- from subtypes of current type\\n- current type (so, recursive types is possible)\\n- parent type\\n\\none can reference a nested user-defined type by specifying a relative path to it from the current type, with a double colon as a path delimiter (e.g. `foo::bar::my_type`)\","]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^\\\\s*([a-z][a-z0-9_]*\\\\s*::\\\\s*)*[a-z][a-z0-9_]*\\\\s*(\\\\([\\\\s\\\\S]+\\\\)\\\\s*)?$\","]
#[doc = "  \"$comment\": \"whitespace characters between tokens are allowed since version 0.10, see https://github.com/kaitai-io/kaitai_struct/issues/792\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct TypeRefSubtype0(::std::string::String);
impl ::std::ops::Deref for TypeRefSubtype0 {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<TypeRefSubtype0> for ::std::string::String {
    fn from(value: TypeRefSubtype0) -> Self {
        value.0
    }
}
impl ::std::convert::From<&TypeRefSubtype0> for TypeRefSubtype0 {
    fn from(value: &TypeRefSubtype0) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for TypeRefSubtype0 {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| {
                ::regress::Regex::new(
                    "^\\s*([a-z][a-z0-9_]*\\s*::\\s*)*[a-z][a-z0-9_]*\\s*(\\([\\s\\S]+\\)\\s*)?$",
                )
                .unwrap()
            });
        if PATTERN.find(value).is_none() {
            return Err ("doesn't match pattern \"^\\s*([a-z][a-z0-9_]*\\s*::\\s*)*[a-z][a-z0-9_]*\\s*(\\([\\s\\S]+\\)\\s*)?$\"" . into ()) ;
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for TypeRefSubtype0 {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for TypeRefSubtype0 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for TypeRefSubtype0 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for TypeRefSubtype0 {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`TypeRefSubtype1`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"enum\": ["]
#[doc = "    \"u1\","]
#[doc = "    \"u2\","]
#[doc = "    \"u2le\","]
#[doc = "    \"u2be\","]
#[doc = "    \"u4\","]
#[doc = "    \"u4le\","]
#[doc = "    \"u4be\","]
#[doc = "    \"u8\","]
#[doc = "    \"u8le\","]
#[doc = "    \"u8be\","]
#[doc = "    \"s1\","]
#[doc = "    \"s2\","]
#[doc = "    \"s2le\","]
#[doc = "    \"s2be\","]
#[doc = "    \"s4\","]
#[doc = "    \"s4le\","]
#[doc = "    \"s4be\","]
#[doc = "    \"s8\","]
#[doc = "    \"s8le\","]
#[doc = "    \"s8be\","]
#[doc = "    \"f4\","]
#[doc = "    \"f4be\","]
#[doc = "    \"f4le\","]
#[doc = "    \"f8\","]
#[doc = "    \"f8be\","]
#[doc = "    \"f8le\","]
#[doc = "    \"str\","]
#[doc = "    \"strz\""]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(
    :: serde :: Deserialize,
    :: serde :: Serialize,
    Clone,
    Copy,
    Debug,
    Eq,
    Hash,
    Ord,
    PartialEq,
    PartialOrd,
)]
pub enum TypeRefSubtype1 {
    #[serde(rename = "u1")]
    U1,
    #[serde(rename = "u2")]
    U2,
    #[serde(rename = "u2le")]
    U2le,
    #[serde(rename = "u2be")]
    U2be,
    #[serde(rename = "u4")]
    U4,
    #[serde(rename = "u4le")]
    U4le,
    #[serde(rename = "u4be")]
    U4be,
    #[serde(rename = "u8")]
    U8,
    #[serde(rename = "u8le")]
    U8le,
    #[serde(rename = "u8be")]
    U8be,
    #[serde(rename = "s1")]
    S1,
    #[serde(rename = "s2")]
    S2,
    #[serde(rename = "s2le")]
    S2le,
    #[serde(rename = "s2be")]
    S2be,
    #[serde(rename = "s4")]
    S4,
    #[serde(rename = "s4le")]
    S4le,
    #[serde(rename = "s4be")]
    S4be,
    #[serde(rename = "s8")]
    S8,
    #[serde(rename = "s8le")]
    S8le,
    #[serde(rename = "s8be")]
    S8be,
    #[serde(rename = "f4")]
    F4,
    #[serde(rename = "f4be")]
    F4be,
    #[serde(rename = "f4le")]
    F4le,
    #[serde(rename = "f8")]
    F8,
    #[serde(rename = "f8be")]
    F8be,
    #[serde(rename = "f8le")]
    F8le,
    #[serde(rename = "str")]
    Str,
    #[serde(rename = "strz")]
    Strz,
}
impl ::std::convert::From<&Self> for TypeRefSubtype1 {
    fn from(value: &TypeRefSubtype1) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for TypeRefSubtype1 {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match *self {
            Self::U1 => f.write_str("u1"),
            Self::U2 => f.write_str("u2"),
            Self::U2le => f.write_str("u2le"),
            Self::U2be => f.write_str("u2be"),
            Self::U4 => f.write_str("u4"),
            Self::U4le => f.write_str("u4le"),
            Self::U4be => f.write_str("u4be"),
            Self::U8 => f.write_str("u8"),
            Self::U8le => f.write_str("u8le"),
            Self::U8be => f.write_str("u8be"),
            Self::S1 => f.write_str("s1"),
            Self::S2 => f.write_str("s2"),
            Self::S2le => f.write_str("s2le"),
            Self::S2be => f.write_str("s2be"),
            Self::S4 => f.write_str("s4"),
            Self::S4le => f.write_str("s4le"),
            Self::S4be => f.write_str("s4be"),
            Self::S8 => f.write_str("s8"),
            Self::S8le => f.write_str("s8le"),
            Self::S8be => f.write_str("s8be"),
            Self::F4 => f.write_str("f4"),
            Self::F4be => f.write_str("f4be"),
            Self::F4le => f.write_str("f4le"),
            Self::F8 => f.write_str("f8"),
            Self::F8be => f.write_str("f8be"),
            Self::F8le => f.write_str("f8le"),
            Self::Str => f.write_str("str"),
            Self::Strz => f.write_str("strz"),
        }
    }
}
impl ::std::str::FromStr for TypeRefSubtype1 {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        match value {
            "u1" => Ok(Self::U1),
            "u2" => Ok(Self::U2),
            "u2le" => Ok(Self::U2le),
            "u2be" => Ok(Self::U2be),
            "u4" => Ok(Self::U4),
            "u4le" => Ok(Self::U4le),
            "u4be" => Ok(Self::U4be),
            "u8" => Ok(Self::U8),
            "u8le" => Ok(Self::U8le),
            "u8be" => Ok(Self::U8be),
            "s1" => Ok(Self::S1),
            "s2" => Ok(Self::S2),
            "s2le" => Ok(Self::S2le),
            "s2be" => Ok(Self::S2be),
            "s4" => Ok(Self::S4),
            "s4le" => Ok(Self::S4le),
            "s4be" => Ok(Self::S4be),
            "s8" => Ok(Self::S8),
            "s8le" => Ok(Self::S8le),
            "s8be" => Ok(Self::S8be),
            "f4" => Ok(Self::F4),
            "f4be" => Ok(Self::F4be),
            "f4le" => Ok(Self::F4le),
            "f8" => Ok(Self::F8),
            "f8be" => Ok(Self::F8be),
            "f8le" => Ok(Self::F8le),
            "str" => Ok(Self::Str),
            "strz" => Ok(Self::Strz),
            _ => Err("invalid value".into()),
        }
    }
}
impl ::std::convert::TryFrom<&str> for TypeRefSubtype1 {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for TypeRefSubtype1 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for TypeRefSubtype1 {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
#[doc = "`TypeSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"properties\": {"]
#[doc = "    \"doc\": {"]
#[doc = "      \"$ref\": \"#/definitions/Doc\""]
#[doc = "    },"]
#[doc = "    \"doc-ref\": {"]
#[doc = "      \"$ref\": \"#/definitions/DocRef\""]
#[doc = "    },"]
#[doc = "    \"enums\": {"]
#[doc = "      \"$ref\": \"#/definitions/EnumsSpec\""]
#[doc = "    },"]
#[doc = "    \"instances\": {"]
#[doc = "      \"$ref\": \"#/definitions/InstancesSpec\""]
#[doc = "    },"]
#[doc = "    \"meta\": {"]
#[doc = "      \"$ref\": \"#/definitions/MetaSpec\""]
#[doc = "    },"]
#[doc = "    \"params\": {"]
#[doc = "      \"$ref\": \"#/definitions/ParamsSpec\""]
#[doc = "    },"]
#[doc = "    \"seq\": {"]
#[doc = "      \"$ref\": \"#/definitions/Attributes\""]
#[doc = "    },"]
#[doc = "    \"to-string\": {"]
#[doc = "      \"$ref\": \"#/definitions/ToString\""]
#[doc = "    },"]
#[doc = "    \"types\": {"]
#[doc = "      \"$ref\": \"#/definitions/TypesSpec\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct TypeSpec {
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub doc: ::std::option::Option<Doc>,
    #[serde(
        rename = "doc-ref",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub doc_ref: ::std::option::Option<DocRef>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub enums: ::std::option::Option<EnumsSpec>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub instances: ::std::option::Option<InstancesSpec>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub meta: ::std::option::Option<MetaSpec>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub params: ::std::option::Option<ParamsSpec>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub seq: ::std::option::Option<Attributes>,
    #[serde(
        rename = "to-string",
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub to_string: ::std::option::Option<ToString>,
    #[serde(default, skip_serializing_if = "::std::option::Option::is_none")]
    pub types: ::std::option::Option<TypesSpec>,
}
impl ::std::convert::From<&TypeSpec> for TypeSpec {
    fn from(value: &TypeSpec) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for TypeSpec {
    fn default() -> Self {
        Self {
            doc: Default::default(),
            doc_ref: Default::default(),
            enums: Default::default(),
            instances: Default::default(),
            meta: Default::default(),
            params: Default::default(),
            seq: Default::default(),
            to_string: Default::default(),
            types: Default::default(),
        }
    }
}
#[doc = "`TypesSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^[a-z][a-z0-9_]*$\": {"]
#[doc = "      \"$ref\": \"#/definitions/TypeSpec\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(transparent)]
pub struct TypesSpec(pub indexmap::IndexMap<TypesSpecKey, TypeSpec>);
impl ::std::ops::Deref for TypesSpec {
    type Target = indexmap::IndexMap<TypesSpecKey, TypeSpec>;
    fn deref(&self) -> &indexmap::IndexMap<TypesSpecKey, TypeSpec> {
        &self.0
    }
}
impl ::std::convert::From<TypesSpec> for indexmap::IndexMap<TypesSpecKey, TypeSpec> {
    fn from(value: TypesSpec) -> Self {
        value.0
    }
}
impl ::std::convert::From<&TypesSpec> for TypesSpec {
    fn from(value: &TypesSpec) -> Self {
        value.clone()
    }
}
impl ::std::convert::From<indexmap::IndexMap<TypesSpecKey, TypeSpec>> for TypesSpec {
    fn from(value: indexmap::IndexMap<TypesSpecKey, TypeSpec>) -> Self {
        Self(value)
    }
}
#[doc = "`TypesSpecKey`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^[a-z][a-z0-9_]*$\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct TypesSpecKey(::std::string::String);
impl ::std::ops::Deref for TypesSpecKey {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<TypesSpecKey> for ::std::string::String {
    fn from(value: TypesSpecKey) -> Self {
        value.0
    }
}
impl ::std::convert::From<&TypesSpecKey> for TypesSpecKey {
    fn from(value: &TypesSpecKey) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for TypesSpecKey {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^[a-z][a-z0-9_]*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^[a-z][a-z0-9_]*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for TypesSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for TypesSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for TypesSpecKey {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for TypesSpecKey {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = "`ValidationSpec`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"description\": \"expression that specifies the only valid value for this attribute\\n\\nshorthand for `eq: value`\\n\\nif the actual value does not satisfy this constraint, a `ValidationNotEqualError` exception will be thrown\","]
#[doc = "      \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"eq\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"eq\": {"]
#[doc = "          \"description\": \"expression that specifies the only valid value for this attribute\\n\\nmore explicit, long form of `valid: value`\\n\\nif the actual value does not satisfy this constraint, a `ValidationNotEqualError` exception will be thrown\","]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"expr\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"expr\": {"]
#[doc = "          \"description\": \"boolean expression that must evaluate to `true` for the attribute value to be considered valid\\n\\nactual value can be referenced via a special built-in local variable `_`\\n\\nfor better declarativeness, it should only be used to enforce validation constraints that cannot be captured by any of the other dedicated `valid` subkeys (in other words, other subkeys should be preferred: for example, prefer `max: 5` to `expr: _ <= 5`)\\n\\nif the actual value does not satisfy this constraint, a `ValidationExprError` exception will be thrown\","]
#[doc = "          \"examples\": ["]
#[doc = "            \"_ % 2 == 0\""]
#[doc = "          ],"]
#[doc = "          \"anyOf\": ["]
#[doc = "            {"]
#[doc = "              \"type\": \"string\""]
#[doc = "            },"]
#[doc = "            {"]
#[doc = "              \"type\": \"boolean\""]
#[doc = "            }"]
#[doc = "          ]"]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"any-of\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"any-of\": {"]
#[doc = "          \"description\": \"list of expressions that specify a set of valid values for this attribute (the actual value must be equal to **any of** the values in the list)\\n\\nif the actual value does not satisfy this constraint, a `ValidationNotAnyOfError` exception will be thrown\","]
#[doc = "          \"type\": \"array\","]
#[doc = "          \"items\": {"]
#[doc = "            \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "          }"]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"required\": ["]
#[doc = "            \"min\""]
#[doc = "          ]"]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"required\": ["]
#[doc = "            \"max\""]
#[doc = "          ]"]
#[doc = "        }"]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"max\": {"]
#[doc = "          \"description\": \"expression that specifies the **maximum** valid value for this attribute\\n\\nactual value must be less than or equal to this value (i.e. `max: value` is functionally equivalent to `expr: _ <= value`)\\n\\nif the actual value does not satisfy this constraint, a `ValidationGreaterThanError` exception will be thrown\\n\\ncan be combined with the `min` key to specify a range\","]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        },"]
#[doc = "        \"min\": {"]
#[doc = "          \"description\": \"expression that specifies the **minimum** valid value for this attribute\\n\\nactual value must be greater than or equal to this value (i.e. `min: value` is functionally equivalent to `expr: _ >= value`)\\n\\nif the actual value does not satisfy this constraint, a `ValidationLessThanError` exception will be thrown\\n\\ncan be combined with the `max` key to specify a range\","]
#[doc = "          \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"object\","]
#[doc = "      \"required\": ["]
#[doc = "        \"in-enum\""]
#[doc = "      ],"]
#[doc = "      \"properties\": {"]
#[doc = "        \"in-enum\": {"]
#[doc = "          \"description\": \"consider only values defined in the enum as valid\\n\\ncan only be used on enum attributes (i.e. those that use the `enum` key)\\n\\nif the actual integer value does not correspond to any defined member of the enum, a `ValidationNotInEnumError` exception will be thrown\","]
#[doc = "          \"const\": true"]
#[doc = "        }"]
#[doc = "      },"]
#[doc = "      \"patternProperties\": {"]
#[doc = "        \"^-\": true"]
#[doc = "      },"]
#[doc = "      \"additionalProperties\": false"]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
pub struct ValidationSpec {
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_0: ::std::option::Option<AnyScalar>,
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_1: ::std::option::Option<ValidationSpecSubtype1>,
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_2: ::std::option::Option<ValidationSpecSubtype2>,
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_3: ::std::option::Option<ValidationSpecSubtype3>,
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_4: ::std::option::Option<ValidationSpecSubtype4>,
    #[serde(
        flatten,
        default,
        skip_serializing_if = "::std::option::Option::is_none"
    )]
    pub subtype_5: ::std::option::Option<ValidationSpecSubtype5>,
}
impl ::std::convert::From<&ValidationSpec> for ValidationSpec {
    fn from(value: &ValidationSpec) -> Self {
        value.clone()
    }
}
impl ::std::default::Default for ValidationSpec {
    fn default() -> Self {
        Self {
            subtype_0: Default::default(),
            subtype_1: Default::default(),
            subtype_2: Default::default(),
            subtype_3: Default::default(),
            subtype_4: Default::default(),
            subtype_5: Default::default(),
        }
    }
}
#[doc = "`ValidationSpecSubtype1`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"required\": ["]
#[doc = "    \"eq\""]
#[doc = "  ],"]
#[doc = "  \"properties\": {"]
#[doc = "    \"eq\": {"]
#[doc = "      \"description\": \"expression that specifies the only valid value for this attribute\\n\\nmore explicit, long form of `valid: value`\\n\\nif the actual value does not satisfy this constraint, a `ValidationNotEqualError` exception will be thrown\","]
#[doc = "      \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct ValidationSpecSubtype1 {
    #[doc = "expression that specifies the only valid value for this attribute\n\nmore explicit, long form of `valid: value`\n\nif the actual value does not satisfy this constraint, a `ValidationNotEqualError` exception will be thrown"]
    pub eq: AnyScalar,
}
impl ::std::convert::From<&ValidationSpecSubtype1> for ValidationSpecSubtype1 {
    fn from(value: &ValidationSpecSubtype1) -> Self {
        value.clone()
    }
}
#[doc = "`ValidationSpecSubtype2`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"required\": ["]
#[doc = "    \"expr\""]
#[doc = "  ],"]
#[doc = "  \"properties\": {"]
#[doc = "    \"expr\": {"]
#[doc = "      \"description\": \"boolean expression that must evaluate to `true` for the attribute value to be considered valid\\n\\nactual value can be referenced via a special built-in local variable `_`\\n\\nfor better declarativeness, it should only be used to enforce validation constraints that cannot be captured by any of the other dedicated `valid` subkeys (in other words, other subkeys should be preferred: for example, prefer `max: 5` to `expr: _ <= 5`)\\n\\nif the actual value does not satisfy this constraint, a `ValidationExprError` exception will be thrown\","]
#[doc = "      \"examples\": ["]
#[doc = "        \"_ % 2 == 0\""]
#[doc = "      ],"]
#[doc = "      \"anyOf\": ["]
#[doc = "        {"]
#[doc = "          \"type\": \"string\""]
#[doc = "        },"]
#[doc = "        {"]
#[doc = "          \"type\": \"boolean\""]
#[doc = "        }"]
#[doc = "      ]"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct ValidationSpecSubtype2 {
    #[doc = "boolean expression that must evaluate to `true` for the attribute value to be considered valid\n\nactual value can be referenced via a special built-in local variable `_`\n\nfor better declarativeness, it should only be used to enforce validation constraints that cannot be captured by any of the other dedicated `valid` subkeys (in other words, other subkeys should be preferred: for example, prefer `max: 5` to `expr: _ <= 5`)\n\nif the actual value does not satisfy this constraint, a `ValidationExprError` exception will be thrown"]
    pub expr: ValidationSpecSubtype2Expr,
}
impl ::std::convert::From<&ValidationSpecSubtype2> for ValidationSpecSubtype2 {
    fn from(value: &ValidationSpecSubtype2) -> Self {
        value.clone()
    }
}
#[doc = "boolean expression that must evaluate to `true` for the attribute value to be considered valid\n\nactual value can be referenced via a special built-in local variable `_`\n\nfor better declarativeness, it should only be used to enforce validation constraints that cannot be captured by any of the other dedicated `valid` subkeys (in other words, other subkeys should be preferred: for example, prefer `max: 5` to `expr: _ <= 5`)\n\nif the actual value does not satisfy this constraint, a `ValidationExprError` exception will be thrown"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"description\": \"boolean expression that must evaluate to `true` for the attribute value to be considered valid\\n\\nactual value can be referenced via a special built-in local variable `_`\\n\\nfor better declarativeness, it should only be used to enforce validation constraints that cannot be captured by any of the other dedicated `valid` subkeys (in other words, other subkeys should be preferred: for example, prefer `max: 5` to `expr: _ <= 5`)\\n\\nif the actual value does not satisfy this constraint, a `ValidationExprError` exception will be thrown\","]
#[doc = "  \"examples\": ["]
#[doc = "    \"_ % 2 == 0\""]
#[doc = "  ],"]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"type\": \"string\""]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"type\": \"boolean\""]
#[doc = "    }"]
#[doc = "  ]"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged)]
pub enum ValidationSpecSubtype2Expr {
    String(::std::string::String),
    Boolean(bool),
}
impl ::std::convert::From<&Self> for ValidationSpecSubtype2Expr {
    fn from(value: &ValidationSpecSubtype2Expr) -> Self {
        value.clone()
    }
}
impl ::std::fmt::Display for ValidationSpecSubtype2Expr {
    fn fmt(&self, f: &mut ::std::fmt::Formatter<'_>) -> ::std::fmt::Result {
        match self {
            Self::String(x) => x.fmt(f),
            Self::Boolean(x) => x.fmt(f),
        }
    }
}
impl ::std::convert::From<bool> for ValidationSpecSubtype2Expr {
    fn from(value: bool) -> Self {
        Self::Boolean(value)
    }
}
#[doc = "`ValidationSpecSubtype3`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"required\": ["]
#[doc = "    \"any-of\""]
#[doc = "  ],"]
#[doc = "  \"properties\": {"]
#[doc = "    \"any-of\": {"]
#[doc = "      \"description\": \"list of expressions that specify a set of valid values for this attribute (the actual value must be equal to **any of** the values in the list)\\n\\nif the actual value does not satisfy this constraint, a `ValidationNotAnyOfError` exception will be thrown\","]
#[doc = "      \"type\": \"array\","]
#[doc = "      \"items\": {"]
#[doc = "        \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "      }"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct ValidationSpecSubtype3 {
    #[doc = "list of expressions that specify a set of valid values for this attribute (the actual value must be equal to **any of** the values in the list)\n\nif the actual value does not satisfy this constraint, a `ValidationNotAnyOfError` exception will be thrown"]
    #[serde(rename = "any-of")]
    pub any_of: ::std::vec::Vec<AnyScalar>,
}
impl ::std::convert::From<&ValidationSpecSubtype3> for ValidationSpecSubtype3 {
    fn from(value: &ValidationSpecSubtype3) -> Self {
        value.clone()
    }
}
#[doc = "`ValidationSpecSubtype4`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"anyOf\": ["]
#[doc = "    {"]
#[doc = "      \"required\": ["]
#[doc = "        \"min\""]
#[doc = "      ]"]
#[doc = "    },"]
#[doc = "    {"]
#[doc = "      \"required\": ["]
#[doc = "        \"max\""]
#[doc = "      ]"]
#[doc = "    }"]
#[doc = "  ],"]
#[doc = "  \"properties\": {"]
#[doc = "    \"max\": {"]
#[doc = "      \"description\": \"expression that specifies the **maximum** valid value for this attribute\\n\\nactual value must be less than or equal to this value (i.e. `max: value` is functionally equivalent to `expr: _ <= value`)\\n\\nif the actual value does not satisfy this constraint, a `ValidationGreaterThanError` exception will be thrown\\n\\ncan be combined with the `min` key to specify a range\","]
#[doc = "      \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "    },"]
#[doc = "    \"min\": {"]
#[doc = "      \"description\": \"expression that specifies the **minimum** valid value for this attribute\\n\\nactual value must be greater than or equal to this value (i.e. `min: value` is functionally equivalent to `expr: _ >= value`)\\n\\nif the actual value does not satisfy this constraint, a `ValidationLessThanError` exception will be thrown\\n\\ncan be combined with the `max` key to specify a range\","]
#[doc = "      \"$ref\": \"#/definitions/AnyScalar\""]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(untagged, deny_unknown_fields)]
pub enum ValidationSpecSubtype4 {
    Variant0 {
        #[doc = "expression that specifies the **minimum** valid value for this attribute\n\nactual value must be greater than or equal to this value (i.e. `min: value` is functionally equivalent to `expr: _ >= value`)\n\nif the actual value does not satisfy this constraint, a `ValidationLessThanError` exception will be thrown\n\ncan be combined with the `max` key to specify a range"]
        min: AnyScalar,
    },
    Variant1 {
        #[doc = "expression that specifies the **maximum** valid value for this attribute\n\nactual value must be less than or equal to this value (i.e. `max: value` is functionally equivalent to `expr: _ <= value`)\n\nif the actual value does not satisfy this constraint, a `ValidationGreaterThanError` exception will be thrown\n\ncan be combined with the `min` key to specify a range"]
        max: AnyScalar,
    },
}
impl ::std::convert::From<&Self> for ValidationSpecSubtype4 {
    fn from(value: &ValidationSpecSubtype4) -> Self {
        value.clone()
    }
}
#[doc = "`ValidationSpecSubtype5`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"object\","]
#[doc = "  \"required\": ["]
#[doc = "    \"in-enum\""]
#[doc = "  ],"]
#[doc = "  \"properties\": {"]
#[doc = "    \"in-enum\": {"]
#[doc = "      \"description\": \"consider only values defined in the enum as valid\\n\\ncan only be used on enum attributes (i.e. those that use the `enum` key)\\n\\nif the actual integer value does not correspond to any defined member of the enum, a `ValidationNotInEnumError` exception will be thrown\","]
#[doc = "      \"const\": true"]
#[doc = "    }"]
#[doc = "  },"]
#[doc = "  \"patternProperties\": {"]
#[doc = "    \"^-\": true"]
#[doc = "  },"]
#[doc = "  \"additionalProperties\": false"]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Deserialize, :: serde :: Serialize, Clone, Debug)]
#[serde(deny_unknown_fields)]
pub struct ValidationSpecSubtype5 {
    #[doc = "consider only values defined in the enum as valid\n\ncan only be used on enum attributes (i.e. those that use the `enum` key)\n\nif the actual integer value does not correspond to any defined member of the enum, a `ValidationNotInEnumError` exception will be thrown"]
    #[serde(rename = "in-enum")]
    pub in_enum: ::serde_json::Value,
}
impl ::std::convert::From<&ValidationSpecSubtype5> for ValidationSpecSubtype5 {
    fn from(value: &ValidationSpecSubtype5) -> Self {
        value.clone()
    }
}
#[doc = "`WikidataIdentifier`"]
#[doc = r""]
#[doc = r" <details><summary>JSON schema</summary>"]
#[doc = r""]
#[doc = r" ```json"]
#[doc = "{"]
#[doc = "  \"type\": \"string\","]
#[doc = "  \"pattern\": \"^Q[1-9]\\\\d*$\","]
#[doc = "  \"$comment\": \"https://www.wikidata.org/wiki/Q43649390#P1793\""]
#[doc = "}"]
#[doc = r" ```"]
#[doc = r" </details>"]
#[derive(:: serde :: Serialize, Clone, Debug, Eq, Hash, Ord, PartialEq, PartialOrd)]
#[serde(transparent)]
pub struct WikidataIdentifier(::std::string::String);
impl ::std::ops::Deref for WikidataIdentifier {
    type Target = ::std::string::String;
    fn deref(&self) -> &::std::string::String {
        &self.0
    }
}
impl ::std::convert::From<WikidataIdentifier> for ::std::string::String {
    fn from(value: WikidataIdentifier) -> Self {
        value.0
    }
}
impl ::std::convert::From<&WikidataIdentifier> for WikidataIdentifier {
    fn from(value: &WikidataIdentifier) -> Self {
        value.clone()
    }
}
impl ::std::str::FromStr for WikidataIdentifier {
    type Err = self::error::ConversionError;
    fn from_str(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        static PATTERN: ::std::sync::LazyLock<::regress::Regex> =
            ::std::sync::LazyLock::new(|| ::regress::Regex::new("^Q[1-9]\\d*$").unwrap());
        if PATTERN.find(value).is_none() {
            return Err("doesn't match pattern \"^Q[1-9]\\d*$\"".into());
        }
        Ok(Self(value.to_string()))
    }
}
impl ::std::convert::TryFrom<&str> for WikidataIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(value: &str) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<&::std::string::String> for WikidataIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: &::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl ::std::convert::TryFrom<::std::string::String> for WikidataIdentifier {
    type Error = self::error::ConversionError;
    fn try_from(
        value: ::std::string::String,
    ) -> ::std::result::Result<Self, self::error::ConversionError> {
        value.parse()
    }
}
impl<'de> ::serde::Deserialize<'de> for WikidataIdentifier {
    fn deserialize<D>(deserializer: D) -> ::std::result::Result<Self, D::Error>
    where
        D: ::serde::Deserializer<'de>,
    {
        ::std::string::String::deserialize(deserializer)?
            .parse()
            .map_err(|e: self::error::ConversionError| {
                <D::Error as ::serde::de::Error>::custom(e.to_string())
            })
    }
}
#[doc = r" Generation of default values for serde."]
pub mod defaults {
    pub(super) fn default_bool<const V: bool>() -> bool {
        V
    }
    pub(super) fn is_bool<const V: bool>(value: &bool) -> bool {
        *value == V
    }
    pub(super) fn ksy_schema_meta_bit_endian() -> super::KsySchemaMetaBitEndian {
        super::KsySchemaMetaBitEndian::Be
    }
    pub(super) fn meta_spec_bit_endian() -> super::MetaSpecBitEndian {
        super::MetaSpecBitEndian::Be
    }
}
