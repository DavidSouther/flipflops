angular.module('flipflops.site.mock', [])
.value 'SiteMock', '/site.json': JSON.stringify
    site :
        title: "FlipFlops",
        subtitle: "Quit blogging. Go to the beach.",
        author: "David Souther (DEVELOPMENT)"
    files:
        '/pages/01_chapter/01_section/index.markdown':
            front:
                title: 'Chapter 1 Section 1'
                path: '/pages/01_chapter/01_section/index.markdown'
            body: """Some text for chapter 1 section 1."""
        '/pages/01_chapter/02_section/index.md':
            front:
                title: 'Chapter 1 Section 2'
                path: '/pages/01_chapter/02_section/index.md'
            body: """Some text for chapter 1 section 2."""
        '/pages/01_chapter/index.md':
            front:
                title: 'Chapter 1 Intro'
                path: '/pages/01_chapter/index.md'
            body: """Some text for chapter 1 Intro."""
        '/pages/02_chapter/01_section/index.md':
            front:
                title: 'Chapter 2 Section 1'
                path: '/pages/02_chapter/01_section/index.md'
            body: """Some text for chapter 2 section 1."""
        '/pages/02_chapter/02_section/index.md':
            front:
                title: 'Chapter 2 Section 2'
                path: '/pages/02_chapter/02_section/index.md'
            body: """Some text for chapter 2 section 2."""
        '/pages/02_chapter/index.md':
            front:
                title: 'Chapter 2 Intro'
                path: '/pages/02_chapter/index.md'
            body: """Some text for chapter 2 Intro."""
