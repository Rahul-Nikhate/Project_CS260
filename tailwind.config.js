/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./public/*.{html,js,css}",
    "./views/*.ejs",
  ],
  theme: {
    backgroundImage: {
      'blpt': "url('/images/neww.png')",
      'formbg': "url('/images/unnamed.jpg')",
    },
    extend: {},
  },
  plugins: [],
}

