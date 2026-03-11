# Phlock of the Tri Lakes Website

Welcome to the static website repository for the Phlock of the Tri Lakes Parrot Head Club!

## Tech Stack
- **HTML5 & CSS3**: Vanilla setup allowing the site to be easily hosted in a static bucket with minimal overhead.
- **JavaScript**: Client-side scripting utilized for lightweight UI components such as:
  - Mobile hamburger navigation menu
  - Dynamic Masonry layout gallery modal logic (`phlock-photos.html`)
  - Markdown blog renderer powered by `marked.js` (`blog.html`)

## Folder Structure
- `public/`: The root directory to be served for the static site.
  - `docs/`: Storage for any downloadable PDFs (Membership Form, etc.).
  - `img/` & `/` (root): Static assets and logos.
  - `pics/<year>/`: Local staging grounds for event photos. The `phlock-photos.html` page's JavaScript fetching logic dynamically constructs galleries out of sequential photo blocks dropped into these folders.
  - `blog/`: Location for simple `.md` markdown files which are automatically rendered to HTML through client-side JS on the `/blog.html` page.

## Demo
*(Replace this section with a Giphy image describing the usage of the application or the walkthrough recording!)*
```markdown
![Walkthrough UI Demo](your-link-here.gif)
```

## Running Locally

To preview your changes locally without a built-in server or package setup:

You can spin up a quick Python HTTP server from the root of the repository:

```bash
cd public
python3 -m http.server 8081
```

Now, navigate to `http://localhost:8081` in your browser!
