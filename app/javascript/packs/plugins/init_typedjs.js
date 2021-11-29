import Typed from 'typed.js';

const options = {
  strings: ['Drama', 'Classic', 'Comedy', 'Action', 'Romantic', 'Thriller', 'Horror', 'Slasher'],
  typeSpeed: 40,
  loop: true,
  showCursor: false
};

const initTyped = () => {
  const typed = document.querySelector(".typed-js")
  if (typed) {
    new Typed('.typed-js', options);
  }
}

// const initTyped = () => {
//   const element = document.querySelector('.typed-js');
//   if (element) {
//     new Typed('.typed-js', {
//       strings: ['Drama', 'Classic', 'Comedy', 'Action', 'Romantic', 'Thriller', 'Horror', 'Slasher'],
//       typeSpeed: 40,
//       loop: true,
//       loopCount: Infinity,
//       showCursor: false
//     });
//   }
// };

export { initTyped };