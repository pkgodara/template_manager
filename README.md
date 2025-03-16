# AI Prompt Template Manager

A Phoenix LiveView application for managing and running AI prompt templates with dynamic placeholders.

## Features

- Create and manage prompt templates with a user-friendly interface
- Support for dynamic placeholders:
  - `[[today]]`: Automatically replaced with current date
  - `[[model]]`: Replaced with user-specified AI model name
- Real-time template processing
- Modern, responsive UI built with Tailwind CSS

## Getting Started

### Prerequisites

- Elixir 1.14 or later
- Phoenix 1.7 or later
- PostgreSQL

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   mix setup
   ```
3. Create and migrate the database:
   ```bash
   mix ecto.setup
   ```
4. Start the Phoenix server:
   ```bash
   mix phx.server
   ```

Visit [`localhost:4000`](http://localhost:4000) to use the application.

## Usage

1. **Creating Templates**
   - Fill in the template name and body
   - Use `[[today]]` and `[[model]]` as placeholders in your template
   - Click "Create Template" to save

2. **Running Templates**
   - Click "Run Template" on any template card
   - Enter the model name
   - View the processed result with replaced placeholders

## Example

Template:
```
I am using [[model]] on [[today]] to help me with my tasks.
```

Processed Result (with model="GPT-4"):
```
I am using GPT-4 on 2025-03-14 to help me with my tasks.
```
