// public/style/scripts.js

console.log('Crescent Framework loaded');

// Função auxiliar para fazer requests
async function fetchData(url, options = {}) {
    try {
        const response = await fetch(url, {
            headers: {
                'Content-Type': 'application/json',
                ...options.headers
            },
            ...options
        });
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        return await response.json();
    } catch (error) {
        console.error('Fetch error:', error);
        throw error;
    }
}

// Função para mostrar alertas
function showAlert(message, type = 'info') {
    const alertClass = `alert alert-${type}`;
    const alertHTML = `
        <div class="${alertClass}" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    `;
    console.log(alertHTML);
}

// Inicialização do documento
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM ready');
});

// Função para deletar elemento
function deleteElement(id) {
    if (confirm('Tem certeza que deseja deletar?')) {
        // Implementar lógica de deleção
        console.log('Deletando elemento:', id);
    }
}
