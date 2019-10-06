module.exports = {
    "parser": "babel-eslint",
    "env": {
        "browser": true,
        "es6": true
    },
    "extends": ["eslint:recommended", "plugin:react/recommended", "prettier"],
    "globals": {
        "Atomics": "readonly",
        "SharedArrayBuffer": "readonly"
    },
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": 2018,
        "sourceType": "module"
    },
    "plugins": [
        "babel", "prettier"
    ],
    "rules": {
        "jsx-quotes": [2, "prefer-double"],
        "key-spacing": 0,
        "max-len": [2, 120, 2, { "ignorePattern": "\\s*<" }],
        "object-curly-spacing": [2, "always"],
        "prettier/prettier": "error",
        "semi": ["error", "always"],
        "no-param-reassign": [2, { "props": false }],
        "no-restricted-syntax": 0,
        "no-nested-ternary": 0,

        // disable for now
        "react/destructuring-assignment": "off",
        "react/forbid-prop-types": "off",
        "react/jsx-one-expression-per-line": "off"
    },
    "settings": {
        "react": {
            "version": require('./package.json').dependencies.react,
        },
    },
};

