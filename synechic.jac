node Note {
    has title: str, text: str, user_id: int;
}

def:pub add_note(title: str, text: str, user_id: int) -> dict[str,any] {
    note - root ++> Note(title=title, text=text, user_id=user_id);
    return {"id": jid(note), "title": note.title};
}

def:pub app->JsxElement {
    has items: list = [];

    async def add -> None {
        note = await add_note("New Item", "This is the new item.", 123);
        items = items + [note];
    }

    <div>
        <button onClick-{lambda -> None {add();}}>
        Add
        </button>
    </div>
}

with entry {
    
}