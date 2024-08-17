import subprocess
import re

def mark(text, args, Mark, extra_cli_args, *a):
    """
    This function is responsible for finding all matching text. 
    extra_cli_args are any extra arguments  passed on the command line when invoking the kitten.
    """
    for idx, m in enumerate(re.finditer(r'\d{5,}', text)):
        start, end = m.span()
        mark_text = text[start:end].replace('\n', '').replace('\0', '')
        # The empty dictionary below will be available as groupdicts
        # in handle_result() and can contain string keys and arbitrary JSON
        # serializable values.
        yield Mark(idx, start, end, mark_text, {})


def handle_result(args, data, target_window_id, boss, extra_cli_args, *a):
    """
    This function is responsible for performing some action on the selected text.
    matches is a list of the selected entries and groupdicts contains
    the arbitrary data associated with each entry in mark() above.
    """
    matches = []
    for m in data['match']:
        if m:
            matches.append(m)

    for word in matches:
        copy_to_clipboard(word)

def copy_to_clipboard(text):
    process = subprocess.Popen('pbcopy', env={'LANG': 'en_US.UTF-8'}, stdin=subprocess.PIPE)
    process.communicate(text.encode('utf-8'))

