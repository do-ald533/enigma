export function Button() {
    function handleClick() {
        console.log('Button clicked');
    }

    return (
        <button onClick={handleClick}>Testando</button>
    )
}