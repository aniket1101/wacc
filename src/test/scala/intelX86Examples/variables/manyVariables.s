.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	# push {rbx, r12, r13, r14, r15}
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov rbp, rsp
	sub rsp, 988
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov rcx, rax
	mov rax, 5
	mov rdx, rax
	mov rax, 6
	mov rsi, rax
	mov rax, 7
	mov rdi, rax
	mov rax, 8
	mov r8, rax
	mov rax, 9
	mov r9, rax
	mov rax, 10
	mov dword ptr [rbp - 988], eax
	mov rax, 11
	mov dword ptr [rbp - 984], eax
	mov rax, 12
	mov dword ptr [rbp - 980], eax
	mov rax, 13
	mov dword ptr [rbp - 976], eax
	mov rax, 14
	mov dword ptr [rbp - 972], eax
	mov rax, 15
	mov dword ptr [rbp - 968], eax
	mov rax, 16
	mov dword ptr [rbp - 964], eax
	mov rax, 17
	mov dword ptr [rbp - 960], eax
	mov rax, 18
	mov dword ptr [rbp - 956], eax
	mov rax, 19
	mov dword ptr [rbp - 952], eax
	mov rax, 20
	mov dword ptr [rbp - 948], eax
	mov rax, 21
	mov dword ptr [rbp - 944], eax
	mov rax, 22
	mov dword ptr [rbp - 940], eax
	mov rax, 23
	mov dword ptr [rbp - 936], eax
	mov rax, 24
	mov dword ptr [rbp - 932], eax
	mov rax, 25
	mov dword ptr [rbp - 928], eax
	mov rax, 26
	mov dword ptr [rbp - 924], eax
	mov rax, 27
	mov dword ptr [rbp - 920], eax
	mov rax, 28
	mov dword ptr [rbp - 916], eax
	mov rax, 29
	mov dword ptr [rbp - 912], eax
	mov rax, 30
	mov dword ptr [rbp - 908], eax
	mov rax, 31
	mov dword ptr [rbp - 904], eax
	mov rax, 32
	mov dword ptr [rbp - 900], eax
	mov rax, 33
	mov dword ptr [rbp - 896], eax
	mov rax, 34
	mov dword ptr [rbp - 892], eax
	mov rax, 35
	mov dword ptr [rbp - 888], eax
	mov rax, 36
	mov dword ptr [rbp - 884], eax
	mov rax, 37
	mov dword ptr [rbp - 880], eax
	mov rax, 38
	mov dword ptr [rbp - 876], eax
	mov rax, 39
	mov dword ptr [rbp - 872], eax
	mov rax, 40
	mov dword ptr [rbp - 868], eax
	mov rax, 41
	mov dword ptr [rbp - 864], eax
	mov rax, 42
	mov dword ptr [rbp - 860], eax
	mov rax, 43
	mov dword ptr [rbp - 856], eax
	mov rax, 44
	mov dword ptr [rbp - 852], eax
	mov rax, 45
	mov dword ptr [rbp - 848], eax
	mov rax, 46
	mov dword ptr [rbp - 844], eax
	mov rax, 47
	mov dword ptr [rbp - 840], eax
	mov rax, 48
	mov dword ptr [rbp - 836], eax
	mov rax, 49
	mov dword ptr [rbp - 832], eax
	mov rax, 50
	mov dword ptr [rbp - 828], eax
	mov rax, 51
	mov dword ptr [rbp - 824], eax
	mov rax, 52
	mov dword ptr [rbp - 820], eax
	mov rax, 53
	mov dword ptr [rbp - 816], eax
	mov rax, 54
	mov dword ptr [rbp - 812], eax
	mov rax, 55
	mov dword ptr [rbp - 808], eax
	mov rax, 56
	mov dword ptr [rbp - 804], eax
	mov rax, 57
	mov dword ptr [rbp - 800], eax
	mov rax, 58
	mov dword ptr [rbp - 796], eax
	mov rax, 59
	mov dword ptr [rbp - 792], eax
	mov rax, 60
	mov dword ptr [rbp - 788], eax
	mov rax, 61
	mov dword ptr [rbp - 784], eax
	mov rax, 62
	mov dword ptr [rbp - 780], eax
	mov rax, 63
	mov dword ptr [rbp - 776], eax
	mov rax, 64
	mov dword ptr [rbp - 772], eax
	mov rax, 65
	mov dword ptr [rbp - 768], eax
	mov rax, 66
	mov dword ptr [rbp - 764], eax
	mov rax, 67
	mov dword ptr [rbp - 760], eax
	mov rax, 68
	mov dword ptr [rbp - 756], eax
	mov rax, 69
	mov dword ptr [rbp - 752], eax
	mov rax, 70
	mov dword ptr [rbp - 748], eax
	mov rax, 71
	mov dword ptr [rbp - 744], eax
	mov rax, 72
	mov dword ptr [rbp - 740], eax
	mov rax, 73
	mov dword ptr [rbp - 736], eax
	mov rax, 74
	mov dword ptr [rbp - 732], eax
	mov rax, 75
	mov dword ptr [rbp - 728], eax
	mov rax, 76
	mov dword ptr [rbp - 724], eax
	mov rax, 77
	mov dword ptr [rbp - 720], eax
	mov rax, 78
	mov dword ptr [rbp - 716], eax
	mov rax, 79
	mov dword ptr [rbp - 712], eax
	mov rax, 80
	mov dword ptr [rbp - 708], eax
	mov rax, 81
	mov dword ptr [rbp - 704], eax
	mov rax, 82
	mov dword ptr [rbp - 700], eax
	mov rax, 83
	mov dword ptr [rbp - 696], eax
	mov rax, 84
	mov dword ptr [rbp - 692], eax
	mov rax, 85
	mov dword ptr [rbp - 688], eax
	mov rax, 86
	mov dword ptr [rbp - 684], eax
	mov rax, 87
	mov dword ptr [rbp - 680], eax
	mov rax, 88
	mov dword ptr [rbp - 676], eax
	mov rax, 89
	mov dword ptr [rbp - 672], eax
	mov rax, 90
	mov dword ptr [rbp - 668], eax
	mov rax, 91
	mov dword ptr [rbp - 664], eax
	mov rax, 92
	mov dword ptr [rbp - 660], eax
	mov rax, 93
	mov dword ptr [rbp - 656], eax
	mov rax, 94
	mov dword ptr [rbp - 652], eax
	mov rax, 95
	mov dword ptr [rbp - 648], eax
	mov rax, 96
	mov dword ptr [rbp - 644], eax
	mov rax, 97
	mov dword ptr [rbp - 640], eax
	mov rax, 98
	mov dword ptr [rbp - 636], eax
	mov rax, 99
	mov dword ptr [rbp - 632], eax
	mov rax, 100
	mov dword ptr [rbp - 628], eax
	mov rax, 101
	mov dword ptr [rbp - 624], eax
	mov rax, 102
	mov dword ptr [rbp - 620], eax
	mov rax, 103
	mov dword ptr [rbp - 616], eax
	mov rax, 104
	mov dword ptr [rbp - 612], eax
	mov rax, 105
	mov dword ptr [rbp - 608], eax
	mov rax, 106
	mov dword ptr [rbp - 604], eax
	mov rax, 107
	mov dword ptr [rbp - 600], eax
	mov rax, 108
	mov dword ptr [rbp - 596], eax
	mov rax, 109
	mov dword ptr [rbp - 592], eax
	mov rax, 110
	mov dword ptr [rbp - 588], eax
	mov rax, 111
	mov dword ptr [rbp - 584], eax
	mov rax, 112
	mov dword ptr [rbp - 580], eax
	mov rax, 113
	mov dword ptr [rbp - 576], eax
	mov rax, 114
	mov dword ptr [rbp - 572], eax
	mov rax, 115
	mov dword ptr [rbp - 568], eax
	mov rax, 116
	mov dword ptr [rbp - 564], eax
	mov rax, 117
	mov dword ptr [rbp - 560], eax
	mov rax, 118
	mov dword ptr [rbp - 556], eax
	mov rax, 119
	mov dword ptr [rbp - 552], eax
	mov rax, 120
	mov dword ptr [rbp - 548], eax
	mov rax, 121
	mov dword ptr [rbp - 544], eax
	mov rax, 122
	mov dword ptr [rbp - 540], eax
	mov rax, 123
	mov dword ptr [rbp - 536], eax
	mov rax, 124
	mov dword ptr [rbp - 532], eax
	mov rax, 125
	mov dword ptr [rbp - 528], eax
	mov rax, 126
	mov dword ptr [rbp - 524], eax
	mov rax, 127
	mov dword ptr [rbp - 520], eax
	mov rax, 128
	mov dword ptr [rbp - 516], eax
	mov rax, 129
	mov dword ptr [rbp - 512], eax
	mov rax, 130
	mov dword ptr [rbp - 508], eax
	mov rax, 131
	mov dword ptr [rbp - 504], eax
	mov rax, 132
	mov dword ptr [rbp - 500], eax
	mov rax, 133
	mov dword ptr [rbp - 496], eax
	mov rax, 134
	mov dword ptr [rbp - 492], eax
	mov rax, 135
	mov dword ptr [rbp - 488], eax
	mov rax, 136
	mov dword ptr [rbp - 484], eax
	mov rax, 137
	mov dword ptr [rbp - 480], eax
	mov rax, 138
	mov dword ptr [rbp - 476], eax
	mov rax, 139
	mov dword ptr [rbp - 472], eax
	mov rax, 140
	mov dword ptr [rbp - 468], eax
	mov rax, 141
	mov dword ptr [rbp - 464], eax
	mov rax, 142
	mov dword ptr [rbp - 460], eax
	mov rax, 143
	mov dword ptr [rbp - 456], eax
	mov rax, 144
	mov dword ptr [rbp - 452], eax
	mov rax, 145
	mov dword ptr [rbp - 448], eax
	mov rax, 146
	mov dword ptr [rbp - 444], eax
	mov rax, 147
	mov dword ptr [rbp - 440], eax
	mov rax, 148
	mov dword ptr [rbp - 436], eax
	mov rax, 149
	mov dword ptr [rbp - 432], eax
	mov rax, 150
	mov dword ptr [rbp - 428], eax
	mov rax, 151
	mov dword ptr [rbp - 424], eax
	mov rax, 152
	mov dword ptr [rbp - 420], eax
	mov rax, 153
	mov dword ptr [rbp - 416], eax
	mov rax, 154
	mov dword ptr [rbp - 412], eax
	mov rax, 155
	mov dword ptr [rbp - 408], eax
	mov rax, 156
	mov dword ptr [rbp - 404], eax
	mov rax, 157
	mov dword ptr [rbp - 400], eax
	mov rax, 158
	mov dword ptr [rbp - 396], eax
	mov rax, 159
	mov dword ptr [rbp - 392], eax
	mov rax, 160
	mov dword ptr [rbp - 388], eax
	mov rax, 161
	mov dword ptr [rbp - 384], eax
	mov rax, 162
	mov dword ptr [rbp - 380], eax
	mov rax, 163
	mov dword ptr [rbp - 376], eax
	mov rax, 164
	mov dword ptr [rbp - 372], eax
	mov rax, 165
	mov dword ptr [rbp - 368], eax
	mov rax, 166
	mov dword ptr [rbp - 364], eax
	mov rax, 167
	mov dword ptr [rbp - 360], eax
	mov rax, 168
	mov dword ptr [rbp - 356], eax
	mov rax, 169
	mov dword ptr [rbp - 352], eax
	mov rax, 170
	mov dword ptr [rbp - 348], eax
	mov rax, 171
	mov dword ptr [rbp - 344], eax
	mov rax, 172
	mov dword ptr [rbp - 340], eax
	mov rax, 173
	mov dword ptr [rbp - 336], eax
	mov rax, 174
	mov dword ptr [rbp - 332], eax
	mov rax, 175
	mov dword ptr [rbp - 328], eax
	mov rax, 176
	mov dword ptr [rbp - 324], eax
	mov rax, 177
	mov dword ptr [rbp - 320], eax
	mov rax, 178
	mov dword ptr [rbp - 316], eax
	mov rax, 179
	mov dword ptr [rbp - 312], eax
	mov rax, 180
	mov dword ptr [rbp - 308], eax
	mov rax, 181
	mov dword ptr [rbp - 304], eax
	mov rax, 182
	mov dword ptr [rbp - 300], eax
	mov rax, 183
	mov dword ptr [rbp - 296], eax
	mov rax, 184
	mov dword ptr [rbp - 292], eax
	mov rax, 185
	mov dword ptr [rbp - 288], eax
	mov rax, 186
	mov dword ptr [rbp - 284], eax
	mov rax, 187
	mov dword ptr [rbp - 280], eax
	mov rax, 188
	mov dword ptr [rbp - 276], eax
	mov rax, 189
	mov dword ptr [rbp - 272], eax
	mov rax, 190
	mov dword ptr [rbp - 268], eax
	mov rax, 191
	mov dword ptr [rbp - 264], eax
	mov rax, 192
	mov dword ptr [rbp - 260], eax
	mov rax, 193
	mov dword ptr [rbp - 256], eax
	mov rax, 194
	mov dword ptr [rbp - 252], eax
	mov rax, 195
	mov dword ptr [rbp - 248], eax
	mov rax, 196
	mov dword ptr [rbp - 244], eax
	mov rax, 197
	mov dword ptr [rbp - 240], eax
	mov rax, 198
	mov dword ptr [rbp - 236], eax
	mov rax, 199
	mov dword ptr [rbp - 232], eax
	mov rax, 200
	mov dword ptr [rbp - 228], eax
	mov rax, 201
	mov dword ptr [rbp - 224], eax
	mov rax, 202
	mov dword ptr [rbp - 220], eax
	mov rax, 203
	mov dword ptr [rbp - 216], eax
	mov rax, 204
	mov dword ptr [rbp - 212], eax
	mov rax, 205
	mov dword ptr [rbp - 208], eax
	mov rax, 206
	mov dword ptr [rbp - 204], eax
	mov rax, 207
	mov dword ptr [rbp - 200], eax
	mov rax, 208
	mov dword ptr [rbp - 196], eax
	mov rax, 209
	mov dword ptr [rbp - 192], eax
	mov rax, 210
	mov dword ptr [rbp - 188], eax
	mov rax, 211
	mov dword ptr [rbp - 184], eax
	mov rax, 212
	mov dword ptr [rbp - 180], eax
	mov rax, 213
	mov dword ptr [rbp - 176], eax
	mov rax, 214
	mov dword ptr [rbp - 172], eax
	mov rax, 215
	mov dword ptr [rbp - 168], eax
	mov rax, 216
	mov dword ptr [rbp - 164], eax
	mov rax, 217
	mov dword ptr [rbp - 160], eax
	mov rax, 218
	mov dword ptr [rbp - 156], eax
	mov rax, 219
	mov dword ptr [rbp - 152], eax
	mov rax, 220
	mov dword ptr [rbp - 148], eax
	mov rax, 221
	mov dword ptr [rbp - 144], eax
	mov rax, 222
	mov dword ptr [rbp - 140], eax
	mov rax, 223
	mov dword ptr [rbp - 136], eax
	mov rax, 224
	mov dword ptr [rbp - 132], eax
	mov rax, 225
	mov dword ptr [rbp - 128], eax
	mov rax, 226
	mov dword ptr [rbp - 124], eax
	mov rax, 227
	mov dword ptr [rbp - 120], eax
	mov rax, 228
	mov dword ptr [rbp - 116], eax
	mov rax, 229
	mov dword ptr [rbp - 112], eax
	mov rax, 230
	mov dword ptr [rbp - 108], eax
	mov rax, 231
	mov dword ptr [rbp - 104], eax
	mov rax, 232
	mov dword ptr [rbp - 100], eax
	mov rax, 233
	mov dword ptr [rbp - 96], eax
	mov rax, 234
	mov dword ptr [rbp - 92], eax
	mov rax, 235
	mov dword ptr [rbp - 88], eax
	mov rax, 236
	mov dword ptr [rbp - 84], eax
	mov rax, 237
	mov dword ptr [rbp - 80], eax
	mov rax, 238
	mov dword ptr [rbp - 76], eax
	mov rax, 239
	mov dword ptr [rbp - 72], eax
	mov rax, 240
	mov dword ptr [rbp - 68], eax
	mov rax, 241
	mov dword ptr [rbp - 64], eax
	mov rax, 242
	mov dword ptr [rbp - 60], eax
	mov rax, 243
	mov dword ptr [rbp - 56], eax
	mov rax, 244
	mov dword ptr [rbp - 52], eax
	mov rax, 245
	mov dword ptr [rbp - 48], eax
	mov rax, 246
	mov dword ptr [rbp - 44], eax
	mov rax, 247
	mov dword ptr [rbp - 40], eax
	mov rax, 248
	mov dword ptr [rbp - 36], eax
	mov rax, 249
	mov dword ptr [rbp - 32], eax
	mov rax, 250
	mov dword ptr [rbp - 28], eax
	mov rax, 251
	mov dword ptr [rbp - 24], eax
	mov rax, 252
	mov dword ptr [rbp - 20], eax
	mov rax, 253
	mov dword ptr [rbp - 16], eax
	mov rax, 254
	mov dword ptr [rbp - 12], eax
	mov rax, 255
	mov dword ptr [rbp - 8], eax
	mov rax, 256
	mov dword ptr [rbp - 4], eax
	add rsp, 988
	mov rax, 0
	# pop {rbx, r12, r13, r14, r15}
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret
