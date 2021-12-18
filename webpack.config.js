/*** *** *** *** *** *** *** *** ***/
// spry_ps webpack configuration file
/*** *** *** *** *** *** *** *** ***/

// required packages
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const eslintWebpackPlugin = require("eslint-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

// check mode is productin or not
const isProduction = process.env.NODE_ENV == "production";

// assign style loader depend on mode
const style_loader = isProduction
  ? MiniCssExtractPlugin.loader
  : "style-loader";

// main config object
const config = {
  entry: {
    index: "./src/index.jsx",
    // vendor: ["your", "venodr", "libraries", "..."],
  },
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "[name].[contenthash].bundle.js",
    clean: true,
  },
  devServer: {
    open: true,
    hot: true,
    host: "localhost",
  },
  module: {
    rules: [
      // js and jsx files
      {
        test: /\.jsx?$/i,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
          // babel configuration
          options: {
            presets: [
              [
                "@babel/preset-env",
                {
                  targets: "> 0.5%, last 2 versions, Firefox ESR, not dead",
                },
              ],
              ["@babel/preset-react", { runtime: "automatic" }],
            ],
            plugins: [
              /*** *** ***/
              // uncomment for enabling css-in-js with emotion library
              // "@emotion",
              /*** *** ***/
              [
                "module-resolver",
                {
                  root: ["./src"],
                  alias: {
                    cm: "./src/components",
                    assets: "./src/assets",
                    store: "./src/store",
                  },
                },
              ],
            ],
          },
        },
      },
      // images
      {
        test: /\.(png|jpe?g|git)$/i,
        type: "asset/resource",
        exclude: /node_modules/,
      },
      // load svg as React Components
      {
        test: /\.svg$/i,
        use: ["@svgr/webpack"],
      },
      // styles
      {
        test: /\.css$/i,
        use: [
          style_loader,
          "css-loader",
          {
            loader: "postcss-loader",
            options: {
              postcssOptions: {
                plugins: [
                  /*** *** ***/
                  // tailwind css configurations
                  [
                    "tailwindcss",
                    {
                      purge: [
                        "./src/**/*.html",
                        "./src/**/*.js",
                        "./src/**/*.jsx",
                      ],
                    },
                  ],
                  /*** *** ***/
                  "autoprefixer",
                ],
              },
            },
          },
        ],
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({ template: "./src/index.html" }),
    new eslintWebpackPlugin({}),
  ],
};

// return config file depend on mode
module.exports = () => {
  if (isProduction) {
    config.mode = "production";

    // add css handler plugin
    config.plugins.push(new MiniCssExtractPlugin());
  } else {
    config.mode = "development";
  }

  return config;
};
