When you type hyphens (-) in a contenteditable &lt;div&gt;, the browser may generate HTML elements or entities depending on how the content is processed. This behavior is due to the way contenteditable handles user input, as it allows rich text editing and automatically generates HTML to represent the content.

For example:

- Typing a single hyphen (-) may remain as plain text.
- Typing multiple hyphens (---) may be interpreted as a horizontal rule (&lt;hr&gt;), depending on the browser or editor behavior.

**Why This Happens**

The contenteditable attribute allows the browser to interpret and format user input as HTML. Some browsers or frameworks may automatically convert certain patterns (like ---) into specific HTML elements (e.g., &lt;hr&gt;). This behavior is often influenced by the browser's built-in editing commands or JavaScript libraries that enhance the contenteditable functionality.

**How to Prevent HTML Generation**

If you want to prevent the automatic generation of HTML elements when typing hyphens, you can sanitize the content of the contenteditable &lt;div&gt; by listening to input events and replacing unwanted HTML with plain text.

**Example: Sanitizing Input in a contenteditable &lt;div&gt;**

import { createSignal } from "solid-js";

export function EditableDiv() {

&nbsp; let editableDiv;

&nbsp; const \[content, setContent\] = createSignal("");

&nbsp; const sanitizeContent = () => {

&nbsp; // Replace unwanted HTML with plain text

&nbsp; const sanitized = editableDiv.innerHTML.replace(/&lt;\[^&gt;\]\*>/g, "");

&nbsp; editableDiv.innerHTML = sanitized;

&nbsp; setContent(sanitized);

&nbsp; };

&nbsp; return (

&nbsp; &lt;div&gt;

&nbsp; <div

&nbsp; ref={editableDiv}

&nbsp; contentEditable="true"

&nbsp; onInput={sanitizeContent}

&nbsp; style={{

&nbsp; border: "1px solid #ccc",

&nbsp; padding: "10px",

&nbsp; minHeight: "50px",

&nbsp; }}

&nbsp; >&lt;/div&gt;

&nbsp; &lt;p&gt;Content: {content()}&lt;/p&gt;

&nbsp; &lt;/div&gt;

&nbsp; );

}

**Explanation**

1. **contentEditable="true"**:
   - Makes the &lt;div&gt; editable by the user.
2. **onInput Event**:
   - Listens for changes in the content of the &lt;div&gt;.
3. **Sanitization**:
   - The sanitizeContent function removes all HTML tags using a regular expression (/&lt;\[^&gt;\]\*>/g) and replaces the content of the &lt;div&gt; with plain text.
4. **Display Content**:
   - The sanitized content is stored in a state variable (content) and displayed below the editable &lt;div&gt;.

**Alternative: Prevent Default Behavior**

If you want to prevent specific behaviors (like converting --- into &lt;hr&gt;), you can intercept the keydown or [input](vscode-file://vscode-app/c:/Users/tomla/AppData/Local/Programs/Microsoft%20VS%20Code/resources/app/out/vs/code/electron-sandbox/workbench/workbench.html) events and prevent the default behavior.

const handleKeyDown = (e) => {

&nbsp; if (e.key === "-") {

&nbsp; e.preventDefault();

&nbsp; document.execCommand("insertText", false, "-");

&nbsp; }

};

Attach this handler to the onKeyDown event of the contenteditable &lt;div&gt;.

**Summary**

- The automatic generation of HTML in a contenteditable &lt;div&gt; is a browser feature.
- You can sanitize the content to remove unwanted HTML or prevent specific behaviors using event listeners.
- Use onInput for sanitization or onKeyDown to intercept specific key presses.
