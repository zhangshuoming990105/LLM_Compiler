import matplotlib.pyplot as plt
# results analysis for ICLR 2025, ablation on cases complexity
simple_ids_all={0, 1, 2, 8, 11, 12, 13, 14, 15, 17, 18, 21, 22, 24, 25, 27, 28, 29, 31, 35, 36, 37, 39, 41, 42, 43, 44, 48, 51, 52, 54, 57, 58, 59, 61, 62, 63, 64, 65, 66, 68, 69, 70, 71, 72, 75, 77, 79, 81, 82, 83, 85, 89, 90, 91, 94, 96, 97, 99, 102, 104, 105, 106, 107, 111, 112, 116, 118, 120, 122, 123, 125, 129, 130, 131, 133, 134, 135, 136, 138, 139, 141, 142, 143, 146, 147, 149, 150, 151, 152, 155, 157, 158, 160, 163, 164, 165, 167, 171, 173, 175, 177, 178, 179, 184, 185, 186, 188, 189, 190, 191, 192, 193, 195, 197, 200, 201, 203, 204, 206, 207, 208, 210, 211, 213, 215, 217, 221, 223, 225, 226, 227, 229, 230, 232, 233, 235, 236, 237, 238, 242, 243, 244, 245, 247, 248, 251, 253, 254, 255, 256, 257, 259, 262, 263, 264, 265, 268, 269, 271, 272, 275, 276, 279, 280, 281, 282, 286, 287, 289, 291, 292, 296, 299, 300, 302, 303, 304, 306, 307, 308, 309, 312, 313, 314, 317, 321, 323, 325, 326, 327, 330, 337, 338, 339, 340, 341, 342, 343, 346, 350, 351, 355, 357, 360, 361, 365, 369, 370, 371, 372, 374, 376, 378, 385, 388, 389, 390, 391, 392, 394, 396, 398, 400, 401, 403, 405, 406, 407, 408, 411, 412, 413, 415, 416, 418, 420, 422, 424, 426, 427, 432, 435, 436, 437, 438, 439, 440, 446, 448, 450, 451, 453, 457, 462, 465, 466, 467, 472, 476, 477, 478, 481, 482, 484, 485, 486, 487, 488, 489, 490, 491, 494, 498}
medium_ids_all={4, 5, 7, 16, 19, 20, 23, 32, 33, 34, 38, 40, 45, 46, 49, 50, 53, 55, 56, 67, 74, 78, 80, 87, 92, 93, 98, 101, 103, 109, 114, 115, 117, 121, 124, 127, 132, 140, 144, 153, 154, 156, 161, 162, 166, 168, 169, 170, 172, 174, 176, 181, 183, 194, 196, 198, 199, 212, 216, 219, 222, 224, 231, 239, 241, 246, 249, 250, 258, 261, 266, 283, 293, 294, 295, 298, 305, 315, 316, 318, 319, 322, 324, 328, 329, 331, 332, 334, 335, 336, 345, 354, 356, 358, 359, 362, 366, 367, 377, 379, 382, 383, 386, 387, 393, 395, 397, 399, 402, 404, 419, 425, 430, 431, 434, 441, 442, 443, 444, 445, 452, 454, 455, 458, 460, 469, 470, 471, 473, 475, 479, 480, 493, 496, 499}
complex_ids_all={3, 260, 6, 9, 10, 267, 270, 273, 274, 277, 278, 26, 284, 285, 30, 288, 290, 297, 301, 47, 310, 311, 60, 320, 73, 76, 333, 84, 86, 88, 344, 347, 348, 349, 95, 352, 353, 100, 363, 364, 108, 110, 368, 113, 373, 119, 375, 380, 381, 126, 128, 384, 137, 145, 148, 409, 410, 414, 159, 417, 421, 423, 428, 429, 433, 180, 182, 187, 447, 449, 456, 202, 459, 205, 461, 463, 464, 209, 468, 214, 218, 474, 220, 483, 228, 234, 492, 495, 240, 497, 252}


baseline_claude_3_5 = [4, 42, 59, 73, 95, 98, 136, 187, 191, 202, 207, 208, 219, 228, 239, 240, 245, 246, 260, 270, 288, 299, 348, 356, 363, 367, 368, 409, 413, 422, 441, 442, 456, 459, 468, 491, 495]
baseline_gpt_4o = [0, 1, 2, 5, 9, 20, 30, 32, 34, 40, 51, 56, 59, 60, 63, 73, 76, 80, 81, 92, 95, 98, 109, 113, 124, 127, 139, 148, 159, 161, 182, 183, 187, 188, 195, 202, 207, 212, 216, 218, 219, 220, 222, 224, 228, 233, 238, 239, 240, 241, 246, 249, 256, 258, 260, 261, 267, 270, 277, 284, 290, 291, 300, 311, 318, 323, 324, 329, 333, 336, 344, 347, 348, 349, 353, 354, 356, 358, 362, 363, 365, 368, 373, 375, 386, 399, 404, 407, 409, 410, 421, 422, 427, 429, 431, 434, 441, 442, 444, 445, 447, 455, 456, 461, 468, 473, 475, 479, 480, 485, 486, 489, 493, 495, 496, 497]
baseline_deepseekcoder = [9, 33, 42, 53, 59, 60, 73, 84, 86, 93, 95, 98, 101, 109, 113, 121, 133, 170, 187, 194, 207, 209, 214, 219, 224, 228, 240, 245, 256, 277, 287, 299, 311, 318, 324, 347, 356, 363, 365, 367, 368, 380, 381, 409, 410, 420, 422, 429, 431, 441, 442, 456, 461, 468, 473, 475, 489, 491, 495]
baseline_claude_3_haiku = [4, 7, 9, 32, 42, 54, 59, 73, 83, 86, 87, 88, 89, 93, 95, 98, 101, 107, 109, 113, 119, 136, 137, 150, 159, 161, 170, 180, 187, 191, 202, 207, 208, 216, 218, 219, 224, 228, 231, 234, 239, 240, 245, 246, 252, 256, 260, 261, 270, 277, 287, 288, 290, 295, 299, 300, 301, 311, 318, 324, 333, 347, 348, 349, 353, 356, 358, 359, 362, 363, 364, 365, 367, 368, 375, 380, 381, 382, 387, 404, 407, 409, 410, 413, 417, 422, 428, 431, 433, 441, 442, 455, 456, 458, 459, 461, 463, 464, 468, 471, 473, 475, 480, 484, 491, 492, 493, 495, 497, 498]
baseline_codestral = [1, 5, 9, 16, 19, 20, 30, 33, 34, 39, 42, 45, 51, 53, 59, 60, 73, 74, 76, 84, 86, 87, 88, 93, 95, 98, 101, 109, 110, 113, 114, 121, 124, 126, 128, 133, 136, 148, 150, 159, 170, 183, 187, 188, 191, 194, 196, 198, 202, 207, 208, 209, 214, 216, 219, 220, 224, 226, 228, 240, 245, 256, 258, 260, 261, 266, 270, 274, 277, 278, 284, 285, 287, 293, 294, 297, 299, 300, 301, 311, 318, 320, 322, 323, 324, 329, 333, 344, 347, 349, 353, 356, 358, 359, 362, 363, 365, 367, 368, 373, 376, 379, 380, 381, 385, 395, 400, 404, 409, 410, 413, 416, 417, 420, 422, 425, 429, 430, 431, 434, 441, 442, 455, 456, 458, 459, 461, 465, 468, 473, 475, 480, 484, 486, 489, 490, 491, 493, 495, 497]
baseline_gpt_4o_mini = [0, 1, 2, 4, 5, 7, 9, 15, 20, 30, 32, 33, 34, 39, 40, 51, 54, 56, 59, 60, 63, 71, 73, 74, 75, 76, 78, 80, 81, 84, 86, 87, 88, 89, 92, 93, 95, 98, 100, 103, 109, 113, 115, 124, 126, 127, 129, 137, 139, 140, 142, 148, 150, 151, 154, 159, 160, 161, 170, 174, 175, 180, 182, 183, 185, 187, 188, 194, 195, 198, 199, 202, 207, 209, 210, 212, 216, 217, 218, 219, 220, 222, 223, 224, 228, 230, 231, 232, 233, 234, 237, 238, 239, 240, 241, 246, 249, 252, 256, 258, 260, 261, 262, 263, 267, 270, 277, 278, 281, 284, 290, 291, 293, 296, 300, 301, 303, 311, 318, 320, 322, 323, 324, 329, 331, 333, 335, 336, 343, 344, 347, 348, 349, 352, 353, 354, 355, 356, 358, 359, 362, 363, 365, 366, 368, 373, 375, 380, 381, 382, 385, 386, 395, 397, 399, 404, 407, 409, 410, 416, 421, 422, 427, 428, 429, 430, 431, 433, 434, 441, 442, 444, 445, 447, 452, 454, 455, 456, 458, 459, 460, 461, 463, 464, 468, 470, 473, 474, 475, 478, 479, 480, 481, 483, 485, 486, 489, 490, 492, 493, 495, 496, 497, 498, 499]

pass_5_claude_3_5 = [95, 202, 219, 228, 240, 260, 348, 367, 368, 409, 456]
pass_5_gpt_4o = [1, 5, 32, 40, 95, 113, 187, 202, 219, 224, 228, 240, 260, 267, 270, 277, 323, 333, 347, 349, 358, 368, 375, 410, 421, 434, 441, 456, 468, 475, 493, 496, 497]
pass_5_deepseekcoder = [33, 42, 59, 60, 73, 84, 95, 98, 101, 113, 121, 133, 139, 153, 194, 207, 217, 219, 228, 240, 245, 256, 260, 277, 287, 299, 311, 318, 347, 356, 363, 367, 368, 374, 375, 381, 391, 409, 410, 422, 429, 441, 442, 456, 461, 468, 473, 475, 489, 491, 495, 499]
pass_5_claude_3_haiku = [4, 32, 42, 54, 59, 73, 83, 86, 87, 88, 89, 93, 95, 98, 101, 107, 113, 136, 137, 150, 159, 161, 180, 187, 191, 202, 207, 208, 218, 219, 228, 231, 239, 240, 245, 246, 252, 256, 260, 270, 277, 287, 288, 290, 295, 299, 301, 311, 318, 324, 333, 348, 353, 356, 358, 359, 363, 365, 367, 368, 375, 382, 404, 407, 409, 410, 413, 422, 428, 431, 433, 441, 442, 455, 456, 458, 459, 461, 463, 468, 471, 473, 475, 480, 484, 491, 492, 493, 495, 497, 498]
pass_5_codestral = [1, 5, 9, 16, 19, 30, 39, 42, 51, 53, 59, 60, 73, 74, 84, 86, 87, 88, 95, 98, 101, 109, 110, 113, 121, 124, 126, 128, 133, 136, 150, 159, 170, 187, 194, 202, 207, 208, 209, 216, 219, 224, 228, 240, 245, 260, 261, 266, 270, 274, 277, 278, 284, 287, 293, 297, 299, 300, 301, 318, 324, 329, 333, 344, 347, 349, 353, 356, 359, 363, 365, 367, 368, 373, 379, 381, 395, 404, 409, 410, 416, 420, 422, 425, 429, 430, 431, 434, 441, 442, 455, 456, 459, 461, 468, 473, 475, 484, 489, 490, 493, 495, 497]
pass_5_gpt_4o_mini = [1, 5, 9, 15, 30, 32, 33, 34, 39, 40, 51, 54, 60, 63, 73, 74, 75, 84, 87, 88, 95, 100, 113, 115, 126, 127, 137, 139, 140, 142, 148, 150, 151, 159, 161, 170, 180, 182, 183, 187, 194, 202, 207, 209, 210, 217, 218, 219, 220, 223, 224, 228, 234, 238, 239, 240, 246, 256, 260, 261, 262, 263, 267, 270, 277, 284, 290, 301, 311, 318, 323, 324, 329, 331, 333, 335, 336, 344, 347, 349, 358, 365, 368, 375, 381, 382, 385, 386, 395, 399, 404, 410, 416, 421, 422, 427, 428, 429, 430, 431, 433, 434, 441, 442, 444, 447, 454, 455, 456, 460, 461, 464, 468, 470, 475, 478, 480, 485, 486, 489, 492, 493, 495, 496, 497, 498]

feedback_claude_3_5 = [202, 228, 240, 260, 348, 409, 456]
feedback_gpt_4o = [32, 219, 228, 240, 260, 333, 358, 368, 410, 441, 456]
feedback_deepseekcoder = [84, 101, 113, 202, 240, 318, 368, 409, 410, 431, 441, 456]
feedback_claude_3_haiku = [4, 32, 73, 83, 86, 87, 88, 95, 98, 113, 136, 137, 150, 161, 180, 202, 218, 219, 228, 239, 240, 252, 260, 270, 277, 290, 295, 301, 311, 324, 333, 348, 353, 359, 367, 368, 375, 409, 410, 422, 428, 431, 433, 456, 458, 461, 484, 492, 493, 497]
feedback_codestral = [9, 30, 42, 51, 53, 59, 73, 86, 88, 95, 98, 101, 109, 113, 121, 159, 187, 202, 207, 209, 219, 228, 240, 245, 260, 261, 270, 277, 284, 287, 301, 318, 324, 329, 333, 344, 349, 353, 356, 367, 368, 381, 409, 410, 422, 425, 429, 431, 441, 442, 456, 459, 461, 468, 493, 495, 497]
feedback_gpt_4o_mini = [1, 5, 9, 32, 33, 40, 51, 73, 74, 88, 95, 113, 137, 139, 140, 161, 180, 187, 194, 202, 218, 219, 224, 228, 234, 239, 240, 260, 261, 267, 270, 277, 290, 311, 323, 324, 331, 333, 347, 349, 358, 368, 375, 381, 386, 395, 410, 421, 422, 428, 429, 430, 431, 433, 434, 441, 447, 455, 456, 461, 464, 468, 470, 475, 492, 493, 495, 496, 497, 498]

annotation_claude_3_5 = [228, 409, 456]
annotation_gpt_4o = [228, 368, 441, 456]
annotation_deepseekcoder = [113, 240, 318, 368, 441, 456]
annotation_claude_3_haiku = [32, 73, 95, 113, 180, 202, 240, 270, 277, 311, 324, 353, 368, 375, 409, 422, 431, 456, 492, 493, 497]
# codestral failed in the annotation method, we use the feedback method instead
annotation_gpt_4o_mini = [5, 9, 32, 74, 95, 113, 187, 194, 202, 224, 228, 239, 240, 261, 267, 270, 277, 311, 324, 331, 347, 358, 375, 410, 421, 422, 431, 434, 441, 455, 456, 461, 464, 470, 475, 493, 495, 497, 498]



def opt(failed_ids, begin_id, end_id):
    all_ids = list(range(begin_id, end_id))
    passed_ids = list(set(all_ids) - set(failed_ids))
    # get % in simple, medium, complex
    simple = len(set(simple_ids_all) & set(passed_ids))*100.0 / len(simple_ids_all)
    medium = len(set(medium_ids_all) & set(passed_ids))*100.0 / len(medium_ids_all)
    complex = len(set(complex_ids_all) & set(passed_ids))*100.0 / len(complex_ids_all)
    return simple, medium, complex

# print("Simple, Medium, Complex")
# print(f"simple: {len(simple_ids_all)}")
# print(f"medium: {len(medium_ids_all)}")
# print(f"complex: {len(complex_ids_all)}")

# draw figure based on collected data
claude_easy = []
claude_medium = []
claude_hard = []

easy, med, hard = opt(baseline_claude_3_5, 0, 500)
claude_easy.append(easy)
claude_medium.append(med)
claude_hard.append(hard)

easy, med, hard = opt(pass_5_claude_3_5, 0, 500)
claude_easy.append(easy)
claude_medium.append(med)
claude_hard.append(hard)

easy, med, hard = opt(feedback_claude_3_5, 0, 500)
claude_easy.append(easy)
claude_medium.append(med)
claude_hard.append(hard)

easy, med, hard = opt(annotation_claude_3_5, 0, 500)
claude_easy.append(easy)
claude_medium.append(med)
claude_hard.append(hard)

gpt_easy = []
gpt_medium = []
gpt_hard = []

easy, med, hard = opt(baseline_gpt_4o, 0, 500)
gpt_easy.append(easy)
gpt_medium.append(med)
gpt_hard.append(hard)

easy, med, hard = opt(pass_5_gpt_4o, 0, 500)
gpt_easy.append(easy)
gpt_medium.append(med)
gpt_hard.append(hard)

easy, med, hard = opt(feedback_gpt_4o, 0, 500)
gpt_easy.append(easy)
gpt_medium.append(med)
gpt_hard.append(hard)

easy, med, hard = opt(annotation_gpt_4o, 0, 500)
gpt_easy.append(easy)
gpt_medium.append(med)
gpt_hard.append(hard)

deepseekcoder_easy = []
deepseekcoder_medium = []
deepseekcoder_hard = []

easy, med, hard = opt(baseline_deepseekcoder, 0, 500)
deepseekcoder_easy.append(easy)
deepseekcoder_medium.append(med)
deepseekcoder_hard.append(hard)

easy, med, hard = opt(pass_5_deepseekcoder, 0, 500)
deepseekcoder_easy.append(easy)
deepseekcoder_medium.append(med)
deepseekcoder_hard.append(hard)

easy, med, hard = opt(feedback_deepseekcoder, 0, 500)
deepseekcoder_easy.append(easy)
deepseekcoder_medium.append(med)
deepseekcoder_hard.append(hard)

easy, med, hard = opt(annotation_deepseekcoder, 0, 500)
deepseekcoder_easy.append(easy)
deepseekcoder_medium.append(med)
deepseekcoder_hard.append(hard)

codestral_easy = []
codestral_medium = []
codestral_hard = []

easy, med, hard = opt(baseline_codestral, 0, 500)
codestral_easy.append(easy)
codestral_medium.append(med)
codestral_hard.append(hard)

easy, med, hard = opt(pass_5_codestral, 0, 500)
codestral_easy.append(easy)
codestral_medium.append(med)
codestral_hard.append(hard)

easy, med, hard = opt(feedback_codestral, 0, 500)
codestral_easy.append(easy)
codestral_medium.append(med)
codestral_hard.append(hard)

easy, med, hard = opt(feedback_codestral, 0, 500)
codestral_easy.append(easy)
codestral_medium.append(med)
codestral_hard.append(hard)

mini_gpt_easy = []
mini_gpt_medium = []
mini_gpt_hard = []

easy, med, hard = opt(baseline_gpt_4o_mini, 0, 500)
mini_gpt_easy.append(easy)
mini_gpt_medium.append(med)
mini_gpt_hard.append(hard)

easy, med, hard = opt(pass_5_gpt_4o_mini, 0, 500)
mini_gpt_easy.append(easy)
mini_gpt_medium.append(med)
mini_gpt_hard.append(hard)

easy, med, hard = opt(feedback_gpt_4o_mini, 0, 500)
mini_gpt_easy.append(easy)
mini_gpt_medium.append(med)
mini_gpt_hard.append(hard)

easy, med, hard = opt(annotation_gpt_4o_mini, 0, 500)
mini_gpt_easy.append(easy)
mini_gpt_medium.append(med)
mini_gpt_hard.append(hard)



mini_claude_easy = []
mini_claude_medium = []
mini_claude_hard = []

easy, med, hard = opt(baseline_claude_3_haiku, 0, 500)
mini_claude_easy.append(easy)
mini_claude_medium.append(med)
mini_claude_hard.append(hard)

easy, med, hard = opt(pass_5_claude_3_haiku, 0, 500)
mini_claude_easy.append(easy)
mini_claude_medium.append(med)
mini_claude_hard.append(hard)

easy, med, hard = opt(feedback_claude_3_haiku, 0, 500)
mini_claude_easy.append(easy)
mini_claude_medium.append(med)
mini_claude_hard.append(hard)

easy, med, hard = opt(annotation_claude_3_haiku, 0, 500)
mini_claude_easy.append(easy)
mini_claude_medium.append(med)
mini_claude_hard.append(hard)

fig = plt.figure()
# fig.suptitle('Ablation Study on Cases Complexity')

# Create one horizontal row with three columns
ax1 = fig.add_subplot(131)
ax1.set_title('Easy')
ax1.plot(['baseline', 'pass 5', 'feedback', 'annotation'], claude_easy, label='claude-3-5', marker='o')
ax1.plot(['baseline', 'pass 5', 'feedback', 'annotation'], gpt_easy, label='gpt-4o', marker='o')
ax1.plot(['baseline', 'pass 5', 'feedback', 'annotation'], deepseekcoder_easy, label='deepseekcoder', marker='o')
ax1.plot(['baseline', 'pass 5', 'feedback', 'annotation'], codestral_easy, label='codestral', marker='o')
ax1.plot(['baseline', 'pass 5', 'feedback', 'annotation'], mini_gpt_easy, label='gpt-4o-mini', marker='o')
ax1.plot(['baseline', 'pass 5', 'feedback', 'annotation'], mini_claude_easy, label='claude-3-haiku', marker='o')
ax1.set_ylabel('Percentage %')
for i in range(len(claude_easy)):
    ax1.annotate(f"{claude_easy[i]:.2f}", (i, claude_easy[i]))
    ax1.annotate(f"{mini_claude_easy[i]:.2f}", (i, mini_claude_easy[i]))

ax2 = fig.add_subplot(132)
ax2.set_title('Medium')
ax2.plot(['baseline', 'pass 5', 'feedback', 'annotation'], claude_medium, label='claude-3-5', marker='o')
ax2.plot(['baseline', 'pass 5', 'feedback', 'annotation'], gpt_medium, label='gpt-4o', marker='o')
ax2.plot(['baseline', 'pass 5', 'feedback', 'annotation'], deepseekcoder_medium, label='deepseekcoder', marker='o')
ax2.plot(['baseline', 'pass 5', 'feedback', 'annotation'], codestral_medium, label='codestral', marker='o')
ax2.plot(['baseline', 'pass 5', 'feedback', 'annotation'], mini_gpt_medium, label='gpt-4o-mini', marker='o')
ax2.plot(['baseline', 'pass 5', 'feedback', 'annotation'], mini_claude_medium, label='claude-3-haiku', marker='o')
ax2.set_ylabel('Percentage %')
for i in range(len(claude_medium)):
    ax2.annotate(f"{claude_medium[i]:.2f}", (i, claude_medium[i]))
    ax2.annotate(f"{mini_claude_medium[i]:.2f}", (i, mini_claude_medium[i]))

ax3 = fig.add_subplot(133)
ax3.set_title('Hard')
ax3.plot(['baseline', 'pass 5', 'feedback', 'annotation'], claude_hard, label='claude-3-5', marker='o')
ax3.plot(['baseline', 'pass 5', 'feedback', 'annotation'], gpt_hard, label='gpt-4o', marker='o')
ax3.plot(['baseline', 'pass 5', 'feedback', 'annotation'], deepseekcoder_hard, label='deepseekcoder', marker='o')
ax3.plot(['baseline', 'pass 5', 'feedback', 'annotation'], codestral_hard, label='codestral', marker='o')
ax3.plot(['baseline', 'pass 5', 'feedback', 'annotation'], mini_gpt_hard, label='gpt-4o-mini', marker='o')
ax3.plot(['baseline', 'pass 5', 'feedback', 'annotation'], mini_claude_hard, label='claude-3-haiku', marker='o')
ax3.set_ylabel('Percentage %')
for i in range(len(claude_hard)):
    ax3.annotate(f"{claude_hard[i]:.2f}", (i, claude_hard[i]))
    ax3.annotate(f"{mini_claude_hard[i]:.2f}", (i, mini_claude_hard[i]))

# Combining legends from all subplots
handles1, labels1 = ax1.get_legend_handles_labels()
handles2,_labels2= ax2.get_legend_handles_labels()
handles3,_labels3= ax3.get_legend_handles_labels()
handles=handles1+handles2+handles3
labels=labels1+_labels2+_labels3
fig.legend(handles[:6], labels[:6], loc='lower right')

fig.set_size_inches(15 ,5)
# plt.tight_layout()
plt.tight_layout(rect=[0 ,.03 ,.9 ,.95 ])
plt.savefig('ablation_study_horizontal_legend.pdf')