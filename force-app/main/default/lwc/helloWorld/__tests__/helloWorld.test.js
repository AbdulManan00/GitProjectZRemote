import { createElement } from 'lwc';
import HelloWorld from 'c/helloWorld';

describe('c-hello-world', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('renders greeting text', () => {
        // Create element
        const element = createElement('c-hello-world', {
            is: HelloWorld
        });
        document.body.appendChild(element);

        // Assert rendered greeting
        const pElement = element.shadowRoot.querySelector('p');
        expect(pElement.textContent).toBe('Hello, World!');
    });

    it('renders updated greeting text when greeting changes', () => {
        // Create element
        const element = createElement('c-hello-world', {
            is: HelloWorld
        });
        document.body.appendChild(element);

        // Update greeting
        element.greeting = 'Salesforce';

        // Assert rendered greeting
        const pElement = element.shadowRoot.querySelector('p');
        expect(pElement.textContent).toBe('Hello, Salesforce!');
    });
});
