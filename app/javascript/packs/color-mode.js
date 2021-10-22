if (window.matchMedia('(prefers-color-scheme: dark)').matches) {
    document.body.classList.add('dark');
}

document.getElementById("color-change").addEventListener("click", changeColorMode);

window.matchMedia('(prefers-color-scheme: dark)')
    .addEventListener('change', event => {
        if (event.matches) {
            //dark mode
            console.log('dark mode');
            document.body.classList.add('dark');
        } else {
            //light mode
            console.log('light mode');
            document.body.classList.remove('dark');
        }
    })

function changeColorMode() {
    document.body.classList.toggle('dark');
}