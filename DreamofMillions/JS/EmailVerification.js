﻿function sendMail() {
    $.ajax({
        type: 'POST',
        url: 'https://mandrillapp.com/api/1.0/messages/send.json',
        data: {
            'key': 'YOUR API KEY HERE',
            'message': {
                'from_email': 'YOUR@EMAIL.HERE',
                'to': [
                    {
                        'email': 'RECIPIENT@EMAIL.HERE',
                        'name': 'RECIPIENT NAME (OPTIONAL)',
                        'type': 'to'
                    }
                ],
                'autotext': 'true',
                'subject': 'YOUR SUBJECT HERE!',
                'html': 'YOUR EMAIL CONTENT HERE! YOU CAN USE HTML!'
            }
        }
    }).done(function (response) {
        console.log(response); // if you're into that sorta thing
    });
}

  