document.addEventListener("DOMContentLoaded", () => {
    const API_KEY = "800b2f768e15b67c873e2f8a";
    const radios = document.querySelectorAll('input[name="currency"]');
    radios.forEach(radio => {
        radio.addEventListener("change", () => {
            localStorage.setItem("currency", radio.value);
            convertPrices();
        });
    });

    const savedCurrency = localStorage.getItem("currency");
    if (savedCurrency) {
        document.querySelector('input[value="' + savedCurrency + '"]').checked = true;
        convertPrices();
    }
    
    async function convertPrices() {
        currency = "";
        
        if(document.getElementById("eurRadio").checked){
            currency = "EUR";
        }else{
            currency = "USD";
        }
        
        if (currency === "EUR") {
            resetToEUR();
            return;
        }

        const res = await fetch(`https://v6.exchangerate-api.com/v6/${API_KEY}/latest/EUR`);
        const data = await res.json();
        const rate = data.conversion_rates[currency];

        document.querySelectorAll(".price").forEach(el => {
            const eur = parseFloat(el.dataset.eur);
            el.innerText = (eur * rate).toFixed(2) + " " + currency;
        });


    }

    function resetToEUR() {
    document.querySelectorAll(".price").forEach(el => {
        el.innerText = el.dataset.eur + " EUR";
    });
}
});