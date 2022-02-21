module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    backgroundColor: theme => ({
      ...theme('colors'),
      'ucllred': '#E30147',
      'ucllblue': '#003469',
      'danger': '#e3342f',
     }),
     textColor: theme => ({
      ...theme('colors'),
      'ucllred': '#E30147',
      'ucllblue': '#003469',
      'danger': '#e3342f',
     }),
     borderColor: theme => ({
      ...theme('colors'),
      'ucllred': '#E30147',
      'ucllblue': '#003469',
      'danger': '#e3342f',
     }),

     extend: {
      animation: {
        'moveintoleft': 'moveintoleft 1s ease-in-out',
        'moveintoright': 'moveintoright 1s ease-in-out',
        'pulse-slow': 'pulse 2s ease-in infinite',
        'moveintobottom': 'moveintobottom 1s ease-in-out',
        'moveintotop': 'moveintotop 1s ease-in-out',
        'moveintorightright': 'moveintorightright 1s ease-in-out',
        'moveintoleftleft': 'moveintoleftleft 1s ease-in-out',
      },
      keyframes: {
        moveintoleft: {
          '0%': { transform: 'translate(50%)' },
          '100%': { transform: 'translate(0%)' },
        },
        moveintoright: {
          '0%': { transform: 'translate(-50%)' },
          '100%': { transform: 'translate(0%)' },
        },
        moveintobottom: {
          '0%': { transform: 'translateY(-50%)' },
          '100%': { transform: 'translateY(0%)' },
        },
        moveintotop: {
          '0%': { transform: 'translateY(50%)' },
          '100%': { transform: 'translateY(0%)' },
        },
        moveintorightright: {
          '0%': { transform: 'translate(-70%)' },
          '100%': { transform: 'translate(0%)' },
        },
        moveintoleftleft: {
          '0%': { transform: 'translate(70%)' },
          '100%': { transform: 'translate(0%)' },
        },
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}