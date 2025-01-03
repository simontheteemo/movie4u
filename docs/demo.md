---
layout: default
title: Demo
description: Movie2U Input/Output Examples
---

[Home](./README.md) | 
[Architecture](./architecture.md) | 
[Technical Stack](./technical-stack.md) | 
[Deployment](./deployment.md) | 
[Demo](./demo.md)

# Demo

## Input Example
### Original Video
<iframe width="560" height="315" src="https://www.youtube.com/embed/o-WKik4qp3U" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Output Examples

### 1. Scene Labels
<details>
<summary>
{
    "videoId": {
        "S": "sometest10"
    },
    "timestamp": {
        "S": "2025-01-03T04:35:25.265Z"
    },
    "audioPath": {
        "S": "audio/sometest10-1735878849469.mp4"
    },
    "comprehensiveNarrative": {
        "S": "Here's a narrative description of the scene:\n\nThe video opens with a close-up of a man's face, his expression warm and jovial as he breaks into genuine laughter. As he speaks, \"Hey, what do you want to do for dinner?\" we can see he's standing in a modern kitchen, with a cooktop visible behind him. He's dressed formally, wearing a tie, suggesting he's just returned from work or a business event.\n\nAs another voice responds, \"Well, we could just stay in and cook for ourselves,\" the man's expressions become increasingly animated. His initial genuine smile transitions through various emotional states - from romantic and conversational to suddenly exaggerated and theatrical. He's clearly playing up his reactions for comedic effect, his tie still perfectly in place as his facial expressions become more dramatic.\n\nThe scene takes a humorous turn in the final moments, with the man's expression shifting from joyful laughter to mock anger and shouting. The sequence ends with him appearing to playfully chase someone off-screen, his face animated with exaggerated outrage - a comical overreaction to the suggestion of cooking at home.\n\nThroughout the brief clip, we stay focused on this one man's face as he performs this range of expressions, creating a humorous mini-performance in response to a simple dinner suggestion. The kitchen setting and his formal attire create an interesting contrast with his increasingly silly behavior, making the scene even more amusing.\n\nThe lighting is consistent throughout, and the kitchen appears modern and well-lit, providing a mundane backdrop for this playful domestic moment."
    },
    "labels": {
        "L": [
            {
                "M": {
                    "timestamp": {
                        "N": "40"
                    },
                    "confidence": {
                        "N": "76.63156127929688"
                    },
                    "label": {
                        "S": "Gray"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "88.08431243896484"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "95.32988739013672"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "88.40914916992188"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "95.35791778564453"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "85.61775970458984"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "88.08431243896484"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "88.08431243896484"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "560"
                    },
                    "confidence": {
                        "N": "95.3819808959961"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "92.06520080566406"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "84.15210723876953"
                    },
                    "label": {
                        "S": "Cooktop"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "97.73165893554688"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "91.86073303222656"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "97.75325012207031"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "84.71581268310547"
                    },
                    "label": {
                        "S": "Indoors"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "84.15210723876953"
                    },
                    "label": {
                        "S": "Kitchen"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "87.9268798828125"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "92.06520080566406"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "92.06520080566406"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1040"
                    },
                    "confidence": {
                        "N": "97.76473236083984"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "97.0572509765625"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "86.41138458251953"
                    },
                    "label": {
                        "S": "Cooktop"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "99.91580200195312"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "98.13837432861328"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "99.92906188964844"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "87.36636352539062"
                    },
                    "label": {
                        "S": "Indoors"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "76.63253021240234"
                    },
                    "label": {
                        "S": "Interior Design"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "86.41138458251953"
                    },
                    "label": {
                        "S": "Kitchen"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "96.15930938720703"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "97.0572509765625"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "97.0572509765625"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "1560"
                    },
                    "confidence": {
                        "N": "99.92906188964844"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "77.28433990478516"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "96.58561706542969"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "82.30758666992188"
                    },
                    "label": {
                        "S": "Cooktop"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "99.89418029785156"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "77.28433990478516"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "98.41503143310547"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "99.91305541992188"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "89.83199310302734"
                    },
                    "label": {
                        "S": "Indoors"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "87.18437194824219"
                    },
                    "label": {
                        "S": "Interior Design"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "82.30758666992188"
                    },
                    "label": {
                        "S": "Kitchen"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "97.18399810791016"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "96.58561706542969"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "96.58561706542969"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "99.91305541992188"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "78.09540557861328"
                    },
                    "label": {
                        "S": "Romantic"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2040"
                    },
                    "confidence": {
                        "N": "77.28433990478516"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "80.41777801513672"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "96.37525177001953"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "86.26936340332031"
                    },
                    "label": {
                        "S": "Cooktop"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "99.86580657958984"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "80.41777801513672"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "98.20553588867188"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "99.88487243652344"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "88.32926177978516"
                    },
                    "label": {
                        "S": "Indoors"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "85.79156494140625"
                    },
                    "label": {
                        "S": "Interior Design"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "86.26936340332031"
                    },
                    "label": {
                        "S": "Kitchen"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "95.89356994628906"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "96.37525177001953"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "96.37525177001953"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "99.88487243652344"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "72.88423919677734"
                    },
                    "label": {
                        "S": "Romantic"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "2560"
                    },
                    "confidence": {
                        "N": "80.41777801513672"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "86.04934692382812"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "96.89527893066406"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "88.77629852294922"
                    },
                    "label": {
                        "S": "Cooktop"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "99.81546020507812"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "86.04934692382812"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "97.6340103149414"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "99.83789825439453"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "96.02657318115234"
                    },
                    "label": {
                        "S": "Indoors"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "95.76217651367188"
                    },
                    "label": {
                        "S": "Interior Design"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "88.77629852294922"
                    },
                    "label": {
                        "S": "Kitchen"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "92.90794372558594"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "96.89527893066406"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "96.89527893066406"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "99.83789825439453"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "78.74337768554688"
                    },
                    "label": {
                        "S": "Romantic"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3040"
                    },
                    "confidence": {
                        "N": "86.04934692382812"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "85.3157958984375"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "96.78086853027344"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "70.45675659179688"
                    },
                    "label": {
                        "S": "Conversation"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "84.7416763305664"
                    },
                    "label": {
                        "S": "Cooktop"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "99.66217803955078"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "85.3157958984375"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "93.92261505126953"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "99.70597076416016"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "96.15097045898438"
                    },
                    "label": {
                        "S": "Indoors"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "95.66036224365234"
                    },
                    "label": {
                        "S": "Interior Design"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "87.1979751586914"
                    },
                    "label": {
                        "S": "Kitchen"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "77.65863800048828"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "96.78086853027344"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "96.78086853027344"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "99.70597076416016"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "76.7562026977539"
                    },
                    "label": {
                        "S": "Romantic"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "3560"
                    },
                    "confidence": {
                        "N": "85.3157958984375"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "82.58390808105469"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "96.34127807617188"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "71.36739349365234"
                    },
                    "label": {
                        "S": "Conversation"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "77.1724624633789"
                    },
                    "label": {
                        "S": "Cooktop"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "99.60552978515625"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "82.58390808105469"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "93.62108612060547"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "99.6604995727539"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "90.68267059326172"
                    },
                    "label": {
                        "S": "Indoors"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "88.15790557861328"
                    },
                    "label": {
                        "S": "Interior Design"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "83.89299011230469"
                    },
                    "label": {
                        "S": "Kitchen"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "75.55467224121094"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "96.34127807617188"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "96.34127807617188"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "99.6604995727539"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "75.8741226196289"
                    },
                    "label": {
                        "S": "Romantic"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4040"
                    },
                    "confidence": {
                        "N": "82.58390808105469"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "95.68730163574219"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "95.93595886230469"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "83.13917541503906"
                    },
                    "label": {
                        "S": "Conversation"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "99.28654479980469"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "95.68730163574219"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "92.56597900390625"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "99.42681884765625"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "95.93595886230469"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "95.93595886230469"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "99.42681884765625"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "79.7032470703125"
                    },
                    "label": {
                        "S": "Smile"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "4560"
                    },
                    "confidence": {
                        "N": "95.68730163574219"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "93.09040832519531"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "95.80435943603516"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "73.31580352783203"
                    },
                    "label": {
                        "S": "Angry"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "99.8319320678711"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "91.32095336914062"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "96.75773620605469"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "99.85082244873047"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "92.40196990966797"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "95.80435943603516"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "95.80435943603516"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "99.85082244873047"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5040"
                    },
                    "confidence": {
                        "N": "91.32095336914062"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "76.71865844726562"
                    },
                    "label": {
                        "S": "Accessories"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "97.38143157958984"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "88.84950256347656"
                    },
                    "label": {
                        "S": "Angry"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "99.80908966064453"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "73.17974853515625"
                    },
                    "label": {
                        "S": "Formal Wear"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "94.72514343261719"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "99.81864166259766"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "91.39566040039062"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "97.38143157958984"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "97.38143157958984"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "99.81864166259766"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "86.0216064453125"
                    },
                    "label": {
                        "S": "Shouting"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "5560"
                    },
                    "confidence": {
                        "N": "73.17974853515625"
                    },
                    "label": {
                        "S": "Tie"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6040"
                    },
                    "confidence": {
                        "N": "96.67143249511719"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6040"
                    },
                    "confidence": {
                        "N": "98.85615539550781"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6040"
                    },
                    "confidence": {
                        "N": "98.86134338378906"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6040"
                    },
                    "confidence": {
                        "N": "96.67143249511719"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6040"
                    },
                    "confidence": {
                        "N": "96.67143249511719"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6040"
                    },
                    "confidence": {
                        "N": "98.86134338378906"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "97.70198059082031"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "99.58779907226562"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "87.24433135986328"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "99.61198425292969"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "97.70198059082031"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "97.70198059082031"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "99.61198425292969"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "6560"
                    },
                    "confidence": {
                        "N": "83.1031723022461"
                    },
                    "label": {
                        "S": "Smile"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7040"
                    },
                    "confidence": {
                        "N": "97.20136260986328"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7040"
                    },
                    "confidence": {
                        "N": "99.4181137084961"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7040"
                    },
                    "confidence": {
                        "N": "77.5557861328125"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7040"
                    },
                    "confidence": {
                        "N": "99.46702575683594"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7040"
                    },
                    "confidence": {
                        "N": "97.20136260986328"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7040"
                    },
                    "confidence": {
                        "N": "97.20136260986328"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7040"
                    },
                    "confidence": {
                        "N": "99.46702575683594"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "97.71566009521484"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "99.39678955078125"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "94.76393127441406"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "99.40470123291016"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "91.595703125"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "97.71566009521484"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "97.71566009521484"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "99.74995422363281"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "7560"
                    },
                    "confidence": {
                        "N": "92.24537658691406"
                    },
                    "label": {
                        "S": "Smile"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "98.2748031616211"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "98.81288146972656"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "93.70230865478516"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "98.8237533569336"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "91.23159790039062"
                    },
                    "label": {
                        "S": "Laughing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "98.2748031616211"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "98.2748031616211"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "99.5142593383789"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8040"
                    },
                    "confidence": {
                        "N": "82.40727233886719"
                    },
                    "label": {
                        "S": "Smile"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8560"
                    },
                    "confidence": {
                        "N": "94.42164611816406"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8560"
                    },
                    "confidence": {
                        "N": "89.36870574951172"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8560"
                    },
                    "confidence": {
                        "N": "80.53819274902344"
                    },
                    "label": {
                        "S": "Fighting"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8560"
                    },
                    "confidence": {
                        "N": "89.36974334716797"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8560"
                    },
                    "confidence": {
                        "N": "94.42164611816406"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8560"
                    },
                    "confidence": {
                        "N": "94.42164611816406"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "8560"
                    },
                    "confidence": {
                        "N": "94.9241943359375"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "92.89176940917969"
                    },
                    "label": {
                        "S": "Adult"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "80.84352111816406"
                    },
                    "label": {
                        "S": "Angry"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "79.92981719970703"
                    },
                    "label": {
                        "S": "Chasing"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "93.85857391357422"
                    },
                    "label": {
                        "S": "Face"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "83.08382415771484"
                    },
                    "label": {
                        "S": "Happy"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "93.85943603515625"
                    },
                    "label": {
                        "S": "Head"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "92.89176940917969"
                    },
                    "label": {
                        "S": "Male"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "92.89176940917969"
                    },
                    "label": {
                        "S": "Man"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "94.6464614868164"
                    },
                    "label": {
                        "S": "Person"
                    }
                }
            },
            {
                "M": {
                    "timestamp": {
                        "N": "9040"
                    },
                    "confidence": {
                        "N": "76.10566711425781"
                    },
                    "label": {
                        "S": "Shouting"
                    }
                }
            }
        ]
    },
    "narrationAudioPath": {
        "S": "narration/sometest10-1735878849469.mp3"
    },
    "status": {
        "S": "COMPLETED"
    },
    "transcriptionPath": {
        "S": "transcripts/sometest10-1735878849469.json"
    },
    "visualNarrative": {
        "S": "Here's a natural description of the scene:\n\nThe video opens with a close-up of a man laughing heartily, his face showing genuine joy. The scene quickly reveals he's standing in a kitchen near a cooktop, dressed formally with a tie, suggesting this might be a special occasion or he's dressed for work.\n\nAs the moment continues, the man appears to be engaged in what seems like a romantic or lighthearted conversation, still maintaining his cheerful demeanor near the kitchen counter. His formal attire and animated expressions suggest he's telling a story or sharing a funny moment.\n\nHowever, the mood takes an interesting turn around the five-second mark - his expression shifts from purely joyful to somewhat agitated, and he begins shouting, though it seems to be in a playful rather than angry manner. The kitchen setting fades from view as the focus tightens on his facial expressions.\n\nIn the final few seconds, we see a rapid transition of emotions - from smiling and laughing to what appears to be mock fighting or playful aggression. The clip concludes with him appearing to chase someone, shouting with an animated expression that mixes both excitement and mock anger.\n\nThroughout the scene, the man's expressions are dynamic and theatrical, suggesting this might be a humorous or playful interaction rather than a serious confrontation."
    }
}
</summary>
</details>

### 2. Scene Narrative
> "In a modern office environment, several people are working at their desks with computer screens displaying various applications. The lighting is bright and natural, coming from large windows..."

### 3. Audio Description
<audio controls>
  <source src="YOUR_S3_POLLY_URL.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio>

## Before/After Comparison
| Aspect | Before | After |
|--------|---------|-------|
| Visual Context | No description | Detailed scene labels and narrative |
| Audio Description | None | Natural voice narration |
| Accessibility | Limited | Enhanced for visually impaired users |