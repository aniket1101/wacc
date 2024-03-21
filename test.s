.intel_syntax noprefix
.globl main
.section .rodata
.text
main:
	push rbp
	sub rsp, 40
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	sub rsp, 2088
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp + 3144], rax
	mov rax, 5
	mov qword ptr [rbp + 3216], rax
	mov rax, 6
	mov qword ptr [rbp + 3288], rax
	mov rax, 7
	mov qword ptr [rbp + 3376], rax
	mov rax, 8
	mov qword ptr [rbp + 3448], rax
	mov rax, 9
	mov qword ptr [rbp + 3496], rax
	mov rax, 10
	mov qword ptr [rbp + 3560], rax
	mov rax, 11
	mov qword ptr [rbp + 3640], rax
	mov rax, 12
	mov qword ptr [rbp + 3704], rax
	mov rax, 13
	mov qword ptr [rbp + 3776], rax
	mov rax, 14
	mov qword ptr [rbp + 3848], rax
	mov rax, 15
	mov qword ptr [rbp + 3912], rax
	mov rax, 16
	mov qword ptr [rbp + 3968], rax
	mov rax, 17
	mov qword ptr [rbp + 4040], rax
	mov rax, 18
	mov qword ptr [rbp + 4160], rax
	mov rax, 19
	mov qword ptr [rbp + 4240], rax
	mov rax, 20
	mov qword ptr [rbp + 4312], rax
	mov rax, 21
	mov qword ptr [rbp + 4392], rax
	mov rax, 22
	mov qword ptr [rbp + 4464], rax
	mov rax, 23
	mov qword ptr [rbp + 4560], rax
	mov rax, 24
	mov qword ptr [rbp + 4640], rax
	mov rax, 25
	mov qword ptr [rbp + 4720], rax
	mov rax, 26
	mov qword ptr [rbp + 4784], rax
	mov rax, 27
	mov qword ptr [rbp + 4864], rax
	mov rax, 28
	mov qword ptr [rbp + 4952], rax
	mov rax, 29
	mov qword ptr [rbp + 5040], rax
	mov rax, 30
	mov qword ptr [rbp + 5120], rax
	mov rax, 31
	mov qword ptr [rbp + 5216], rax
	mov rax, 32
	mov qword ptr [rbp + 5288], rax
	mov rax, 33
	mov qword ptr [rbp + 5400], rax
	mov rax, 34
	mov qword ptr [rbp + 5496], rax
	mov rax, 35
	mov qword ptr [rbp + 5568], rax
	mov rax, 36
	mov qword ptr [rbp + 5608], rax
	mov rax, 37
	mov qword ptr [rbp + 5688], rax
	mov rax, 38
	mov qword ptr [rbp + 5792], rax
	mov rax, 39
	mov qword ptr [rbp + 5872], rax
	mov rax, 40
	mov qword ptr [rbp + 5952], rax
	mov rax, 41
	mov qword ptr [rbp + 6056], rax
	mov rax, 42
	mov qword ptr [rbp + 6144], rax
	mov rax, 43
	mov qword ptr [rbp + 6224], rax
	mov rax, 44
	mov qword ptr [rbp + 6312], rax
	mov rax, 45
	mov qword ptr [rbp + 6416], rax
	mov rax, 46
	mov qword ptr [rbp + 6504], rax
	mov rax, 47
	mov qword ptr [rbp + 6584], rax
	mov rax, 48
	mov qword ptr [rbp + 6664], rax
	mov rax, 49
	mov qword ptr [rbp + 6736], rax
	mov rax, 50
	mov qword ptr [rbp + 6816], rax
	mov rax, 51
	mov qword ptr [rbp + 6920], rax
	mov rax, 52
	mov qword ptr [rbp + 7008], rax
	mov rax, 53
	mov qword ptr [rbp + 7096], rax
	mov rax, 54
	mov qword ptr [rbp + 7176], rax
	mov rax, 55
	mov qword ptr [rbp + 7288], rax
	mov rax, 56
	mov qword ptr [rbp + 7352], rax
	mov rax, 57
	mov qword ptr [rbp + 7432], rax
	mov rax, 58
	mov qword ptr [rbp + 7520], rax
	mov rax, 59
	mov qword ptr [rbp + 7600], rax
	mov rax, 60
	mov qword ptr [rbp + 7696], rax
	mov rax, 61
	mov qword ptr [rbp + 7776], rax
	mov rax, 62
	mov qword ptr [rbp + 7880], rax
	mov rax, 63
	mov qword ptr [rbp + 7976], rax
	mov rax, 64
	mov qword ptr [rbp + 8040], rax
	mov rax, 65
	mov qword ptr [rbp + 8120], rax
	mov rax, 66
	mov qword ptr [rbp + 8208], rax
	mov rax, 67
	mov qword ptr [rbp + 8296], rax
	mov rax, 68
	mov qword ptr [rbp + 8376], rax
	mov rax, 69
	mov qword ptr [rbp + 8464], rax
	mov rax, 70
	mov qword ptr [rbp + 8568], rax
	mov rax, 71
	mov qword ptr [rbp + 8664], rax
	mov rax, 72
	mov qword ptr [rbp + 8760], rax
	mov rax, 73
	mov qword ptr [rbp + 8848], rax
	mov rax, 74
	mov qword ptr [rbp + 8936], rax
	mov rax, 75
	mov qword ptr [rbp + 9040], rax
	mov rax, 76
	mov qword ptr [rbp + 9136], rax
	mov rax, 77
	mov qword ptr [rbp + 9216], rax
	mov rax, 78
	mov qword ptr [rbp + 9304], rax
	mov rax, 79
	mov qword ptr [rbp + 9392], rax
	mov rax, 80
	mov qword ptr [rbp + 9496], rax
	mov rax, 81
	mov qword ptr [rbp + 9576], rax
	mov rax, 82
	mov qword ptr [rbp + 9648], rax
	mov rax, 83
	mov qword ptr [rbp + 9760], rax
	mov rax, 84
	mov qword ptr [rbp + 9848], rax
	mov rax, 85
	mov qword ptr [rbp + 9936], rax
	mov rax, 86
	mov qword ptr [rbp + 10024], rax
	mov rax, 87
	mov qword ptr [rbp + 10120], rax
	mov rax, 88
	mov qword ptr [rbp + 10208], rax
	mov rax, 89
	mov qword ptr [rbp + 10296], rax
	mov rax, 90
	mov qword ptr [rbp + 10384], rax
	mov rax, 91
	mov qword ptr [rbp + 10472], rax
	mov rax, 92
	mov qword ptr [rbp + 10568], rax
	mov rax, 93
	mov qword ptr [rbp + 10672], rax
	mov rax, 94
	mov qword ptr [rbp + 10784], rax
	mov rax, 95
	mov qword ptr [rbp + 10904], rax
	mov rax, 96
	mov qword ptr [rbp + 11032], rax
	mov rax, 97
	mov qword ptr [rbp + 11144], rax
	mov rax, 98
	mov qword ptr [rbp + 11240], rax
	mov rax, 99
	mov qword ptr [rbp + 11344], rax
	mov rax, 100
	mov qword ptr [rbp + 11392], rax
	mov rax, 101
	mov qword ptr [rbp + 11432], rax
	mov rax, 102
	mov qword ptr [rbp + 11440], rax
	mov rax, 103
	mov qword ptr [rbp + 11464], rax
	mov rax, 104
	mov qword ptr [rbp + 11472], rax
	mov rax, 105
	mov qword ptr [rbp + 11552], rax
	mov rax, 106
	mov qword ptr [rbp + 11648], rax
	mov rax, 107
	mov qword ptr [rbp + 11720], rax
	mov rax, 108
	mov qword ptr [rbp + 11816], rax
	mov rax, 109
	mov qword ptr [rbp + 11896], rax
	mov rax, 110
	mov qword ptr [rbp + 11968], rax
	mov rax, 111
	mov qword ptr [rbp + 12048], rax
	mov rax, 112
	mov qword ptr [rbp + 12128], rax
	mov rax, 113
	mov qword ptr [rbp + 12216], rax
	mov rax, 114
	mov qword ptr [rbp + 12296], rax
	mov rax, 115
	mov qword ptr [rbp + 12376], rax
	mov rax, 116
	mov qword ptr [rbp + 12456], rax
	mov rax, 117
	mov qword ptr [rbp + 12560], rax
	mov rax, 118
	mov qword ptr [rbp + 12648], rax
	mov rax, 119
	mov qword ptr [rbp + 12736], rax
	mov rax, 120
	mov qword ptr [rbp + 12816], rax
	mov rax, 121
	mov qword ptr [rbp + 12896], rax
	mov rax, 122
	mov qword ptr [rbp + 12992], rax
	mov rax, 123
	mov qword ptr [rbp + 13080], rax
	mov rax, 124
	mov qword ptr [rbp + 13168], rax
	mov rax, 125
	mov qword ptr [rbp + 13256], rax
	mov rax, 126
	mov qword ptr [rbp + 13352], rax
	mov rax, 127
	mov qword ptr [rbp + 13464], rax
	mov rax, 128
	mov qword ptr [rbp + 13552], rax
	mov rax, 129
	mov qword ptr [rbp + 13632], rax
	mov rax, 130
	mov qword ptr [rbp + 13728], rax
	mov rax, 131
	mov qword ptr [rbp + 13808], rax
	mov rax, 132
	mov qword ptr [rbp + 13912], rax
	mov rax, 133
	mov qword ptr [rbp + 13984], rax
	mov rax, 134
	mov qword ptr [rbp + 14080], rax
	mov rax, 135
	mov qword ptr [rbp + 14176], rax
	mov rax, 136
	mov qword ptr [rbp + 14184], rax
	mov rax, 137
	mov qword ptr [rbp + 14248], rax
	mov rax, 138
	mov qword ptr [rbp + 14328], rax
	mov rax, 139
	mov qword ptr [rbp + 14432], rax
	mov rax, 140
	mov qword ptr [rbp + 14512], rax
	mov rax, 141
	mov qword ptr [rbp + 14600], rax
	mov rax, 142
	mov qword ptr [rbp + 14680], rax
	mov rax, 143
	mov qword ptr [rbp + 14776], rax
	mov rax, 144
	mov qword ptr [rbp + 14848], rax
	mov rax, 145
	mov qword ptr [rbp + 14928], rax
	mov rax, 146
	mov qword ptr [rbp + 15016], rax
	mov rax, 147
	mov qword ptr [rbp + 15088], rax
	mov rax, 148
	mov qword ptr [rbp + 15160], rax
	mov rax, 149
	mov qword ptr [rbp + 15240], rax
	mov rax, 150
	mov qword ptr [rbp + 15312], rax
	mov rax, 151
	mov qword ptr [rbp + 15392], rax
	mov rax, 152
	mov qword ptr [rbp + 15456], rax
	mov rax, 153
	mov qword ptr [rbp + 15520], rax
	mov rax, 154
	mov qword ptr [rbp + 15584], rax
	mov rax, 155
	mov qword ptr [rbp + 15656], rax
	mov rax, 156
	mov qword ptr [rbp + 15736], rax
	mov rax, 157
	mov qword ptr [rbp + 15816], rax
	mov rax, 158
	mov qword ptr [rbp + 15912], rax
	mov rax, 159
	mov qword ptr [rbp + 15992], rax
	mov rax, 160
	mov qword ptr [rbp + 16064], rax
	mov rax, 161
	mov qword ptr [rbp + 16136], rax
	mov rax, 162
	mov qword ptr [rbp + 16208], rax
	mov rax, 163
	mov qword ptr [rbp + 16272], rax
	mov rax, 164
	mov qword ptr [rbp + 16336], rax
	mov rax, 165
	mov qword ptr [rbp + 16408], rax
	mov rax, 166
	mov qword ptr [rbp + 16472], rax
	mov rax, 167
	mov qword ptr [rbp + 16528], rax
	mov rax, 168
	mov qword ptr [rbp + 16584], rax
	mov rax, 169
	mov qword ptr [rbp + 16640], rax
	mov rax, 170
	mov qword ptr [rbp + 16680], rax
	mov rax, 171
	mov qword ptr [rbp + 16720], rax
	mov rax, 172
	mov qword ptr [rbp + 16776], rax
	mov rax, 173
	mov qword ptr [rbp + 16816], rax
	mov rax, 174
	mov qword ptr [rbp + 16840], rax
	mov rax, 175
	mov qword ptr [rbp + 16864], rax
	mov rax, 176
	mov qword ptr [rbp + 16880], rax
	mov rax, 177
	mov qword ptr [rbp + 16888], rax
	mov rax, 178
	mov qword ptr [rbp + 16896], rax
	mov rax, 179
	mov qword ptr [rbp + 16904], rax
	mov rax, 180
	mov qword ptr [rbp + 16912], rax
	mov rax, 181
	mov qword ptr [rbp + 16920], rax
	mov rax, 182
	mov qword ptr [rbp + 16928], rax
	mov rax, 183
	mov qword ptr [rbp + 16936], rax
	mov rax, 184
	mov qword ptr [rbp + 16944], rax
	mov rax, 185
	mov qword ptr [rbp + 16952], rax
	mov rax, 186
	mov qword ptr [rbp + 16960], rax
	mov rax, 187
	mov qword ptr [rbp + 16976], rax
	mov rax, 188
	mov qword ptr [rbp + 16984], rax
	mov rax, 189
	mov qword ptr [rbp + 16992], rax
	mov rax, 190
	mov qword ptr [rbp + 17000], rax
	mov rax, 191
	mov qword ptr [rbp + 17008], rax
	mov rax, 192
	mov qword ptr [rbp + 17016], rax
	mov rax, 193
	mov qword ptr [rbp + 17024], rax
	mov rax, 194
	mov qword ptr [rbp + 17032], rax
	mov rax, 195
	mov qword ptr [rbp + 17040], rax
	mov rax, 196
	mov qword ptr [rbp + 17048], rax
	mov rax, 197
	mov qword ptr [rbp + 17056], rax
	mov rax, 198
	mov qword ptr [rbp + 17064], rax
	mov rax, 199
	mov qword ptr [rbp + 17072], rax
	mov rax, 200
	mov qword ptr [rbp + 17080], rax
	mov rax, 201
	mov qword ptr [rbp + 17088], rax
	mov rax, 202
	mov qword ptr [rbp + 17096], rax
	mov rax, 203
	mov qword ptr [rbp + 17104], rax
	mov rax, 204
	mov qword ptr [rbp + 17112], rax
	mov rax, 205
	mov qword ptr [rbp + 17120], rax
	mov rax, 206
	mov qword ptr [rbp + 17128], rax
	mov rax, 207
	mov qword ptr [rbp + 17136], rax
	mov rax, 208
	mov qword ptr [rbp + 17144], rax
	mov rax, 209
	mov qword ptr [rbp + 17152], rax
	mov rax, 210
	mov qword ptr [rbp + 17160], rax
	mov rax, 211
	mov qword ptr [rbp + 17168], rax
	mov rax, 212
	mov qword ptr [rbp + 17176], rax
	mov rax, 213
	mov qword ptr [rbp + 17184], rax
	mov rax, 214
	mov qword ptr [rbp + 17192], rax
	mov rax, 215
	mov qword ptr [rbp + 17200], rax
	mov rax, 216
	mov qword ptr [rbp + 17208], rax
	mov rax, 217
	mov qword ptr [rbp + 17216], rax
	mov rax, 218
	mov qword ptr [rbp + 17224], rax
	mov rax, 219
	mov qword ptr [rbp + 17232], rax
	mov rax, 220
	mov qword ptr [rbp + 17240], rax
	mov rax, 221
	mov qword ptr [rbp + 17248], rax
	mov rax, 222
	mov qword ptr [rbp + 17256], rax
	mov rax, 223
	mov qword ptr [rbp + 17264], rax
	mov rax, 224
	mov qword ptr [rbp + 17272], rax
	mov rax, 225
	mov qword ptr [rbp + 17280], rax
	mov rax, 226
	mov qword ptr [rbp + 17288], rax
	mov rax, 227
	mov qword ptr [rbp + 17296], rax
	mov rax, 228
	mov qword ptr [rbp + 17304], rax
	mov rax, 229
	mov qword ptr [rbp + 17312], rax
	mov rax, 230
	mov qword ptr [rbp + 17320], rax
	mov rax, 231
	mov qword ptr [rbp + 17328], rax
	mov rax, 232
	mov qword ptr [rbp + 17336], rax
	mov rax, 233
	mov qword ptr [rbp + 17344], rax
	mov rax, 234
	mov qword ptr [rbp + 17352], rax
	mov rax, 235
	mov qword ptr [rbp + 17360], rax
	mov rax, 236
	mov qword ptr [rbp + 17368], rax
	mov rax, 237
	mov qword ptr [rbp + 17376], rax
	mov rax, 238
	mov qword ptr [rbp + 17384], rax
	mov rax, 239
	mov qword ptr [rbp + 17392], rax
	mov rax, 240
	mov qword ptr [rbp + 17400], rax
	mov rax, 241
	mov qword ptr [rbp + 17408], rax
	mov rax, 242
	mov qword ptr [rbp + 17416], rax
	mov rax, 243
	mov qword ptr [rbp + 17424], rax
	mov rax, 244
	mov qword ptr [rbp + 17432], rax
	mov rax, 245
	mov qword ptr [rbp + 17440], rax
	mov rax, 246
	mov qword ptr [rbp + 17448], rax
	mov rax, 247
	mov qword ptr [rbp + 17456], rax
	mov rax, 248
	mov qword ptr [rbp + 17464], rax
	mov rax, 249
	mov qword ptr [rbp + 17472], rax
	mov rax, 250
	mov qword ptr [rbp + 17480], rax
	mov rax, 251
	mov qword ptr [rbp + 17488], rax
	mov rax, 252
	mov qword ptr [rbp + 17496], rax
	mov rax, 253
	mov qword ptr [rbp + 17504], rax
	mov rax, 254
	mov qword ptr [rbp + 17512], rax
	mov rax, 255
	mov qword ptr [rbp + 17520], rax
	mov rax, 256
	mov qword ptr [rbp + 17528], rax
	call wacc_f1
	mov qword ptr [rbp + 17536], rax
	call wacc_f2
	mov qword ptr [rbp + 17544], rax
	call wacc_f3
	mov qword ptr [rbp + 17552], rax
	call wacc_f4
	mov qword ptr [rbp + 17560], rax
	call wacc_f5
	mov qword ptr [rbp + 17568], rax
	call wacc_f6
	mov qword ptr [rbp + 17576], rax
	call wacc_f7
	mov qword ptr [rbp + 17584], rax
	call wacc_f8
	mov qword ptr [rbp + 17592], rax
	call wacc_f9
	add rsp, 2088
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	add rsp, 40
	pop rbp
	ret

wacc_f7:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2064]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 1936]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1840]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1776]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1720]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1664]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1600]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1560]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1488]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1424]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1360]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1312]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1256]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1200]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1136]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 1072]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 1008]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 952]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 896]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 856]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 800]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 752]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 712]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 656]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 600]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 544]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 512]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 472]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 424]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp - 328]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp - 296]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp - 256]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp - 224]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp - 176]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp - 152]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp - 128]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp - 120]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp - 64]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp - 40]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 16]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 72]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 136]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 216]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 248]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 312]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 376]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 432]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 464]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 520]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 560]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 592]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 640]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 656]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 720]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 744]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 784]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 816]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 848]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 880]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 928]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 968]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 1016]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 1192]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 1216]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 1256]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 1408]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 1432]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 1584]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 1608]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 1672]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 1712]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 1752]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 1800]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 1832]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 1872]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 1896]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 1936]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 1992]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 2032]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 2088]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 2144]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 2192]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 2248]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 2312]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 2384]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 2472]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 2528]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 2600]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 2656]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 2696]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 2768]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 2840]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 2880]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 2944]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 3008]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 3064]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 3136]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 3200]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 3272]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 3328]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 3392]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 3464]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 3544]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 3624]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 3688]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 3760]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 3808]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 3880]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 3936]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 4024]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 4096]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 4152]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 4232]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 4296]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 4368]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 4448]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 4528]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 4592]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 4672]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 4744]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 4808]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 4888]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 4960]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 5048]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 5112]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 5176]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 5248]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 5304]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 5392]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 5472]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 5560]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 5576]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 5640]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 5696]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 5760]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 5840]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 5912]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 5984]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 6064]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 6136]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 6200]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 6272]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 6352]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 6424]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 6496]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 6544]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 6648]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 6720]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 6792]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 6864]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 6928]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 6992]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 7064]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 7128]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 7208]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 7272]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 7336]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 7416]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 7472]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 7544]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 7608]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 7680]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 7744]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 7816]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 7896]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 7952]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 8008]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 8056]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 8136]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 8200]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 8264]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 8344]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 8416]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 8472]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 8576]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 8640]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 8712]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 8776]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 8840]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 8912]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 8984]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 9056]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 9120]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 9184]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 9256]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 9320]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 9376]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 9456]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 9528]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 9600]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 9656]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 9728]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 9800]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 9872]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 9944]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 10008]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 10080]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 10160]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 10224]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 10304]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 10376]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 10440]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 10512]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 10624]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 10688]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 10768]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 10856]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 10944]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 11024]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 11104]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 11192]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 11288]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 11400]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 11480]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 11544]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 11608]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 11672]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 11752]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 11824]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 11880]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 11944]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 12008]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 12088]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 12152]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 12232]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 12320]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 12392]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 12464]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 12544]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 12616]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 12696]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 12784]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 12864]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 12936]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 13008]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 13088]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 13160]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 13248]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 13328]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 13400]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 13488]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 13560]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 13640]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 13720]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 13800]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 13864]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 13960]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 14032]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 14088]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 14128]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 14272]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 14376]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 14464]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2064], rax
	mov rax, 5
	mov qword ptr [rbp - 1936], rax
	mov rax, 6
	mov qword ptr [rbp - 1840], rax
	mov rax, 7
	mov qword ptr [rbp - 1776], rax
	mov rax, 8
	mov qword ptr [rbp - 1720], rax
	mov rax, 9
	mov qword ptr [rbp - 1664], rax
	mov rax, 10
	mov qword ptr [rbp - 1600], rax
	mov rax, 11
	mov qword ptr [rbp - 1560], rax
	mov rax, 12
	mov qword ptr [rbp - 1488], rax
	mov rax, 13
	mov qword ptr [rbp - 1424], rax
	mov rax, 14
	mov qword ptr [rbp - 1360], rax
	mov rax, 15
	mov qword ptr [rbp - 1312], rax
	mov rax, 16
	mov qword ptr [rbp - 1256], rax
	mov rax, 17
	mov qword ptr [rbp - 1200], rax
	mov rax, 18
	mov qword ptr [rbp - 1136], rax
	mov rax, 19
	mov qword ptr [rbp - 1072], rax
	mov rax, 20
	mov qword ptr [rbp - 1008], rax
	mov rax, 21
	mov qword ptr [rbp - 952], rax
	mov rax, 22
	mov qword ptr [rbp - 896], rax
	mov rax, 23
	mov qword ptr [rbp - 856], rax
	mov rax, 24
	mov qword ptr [rbp - 800], rax
	mov rax, 25
	mov qword ptr [rbp - 752], rax
	mov rax, 26
	mov qword ptr [rbp - 712], rax
	mov rax, 27
	mov qword ptr [rbp - 656], rax
	mov rax, 28
	mov qword ptr [rbp - 600], rax
	mov rax, 29
	mov qword ptr [rbp - 544], rax
	mov rax, 30
	mov qword ptr [rbp - 512], rax
	mov rax, 31
	mov qword ptr [rbp - 472], rax
	mov rax, 32
	mov qword ptr [rbp - 424], rax
	mov rax, 33
	mov qword ptr [rbp - 328], rax
	mov rax, 34
	mov qword ptr [rbp - 296], rax
	mov rax, 35
	mov qword ptr [rbp - 256], rax
	mov rax, 36
	mov qword ptr [rbp - 224], rax
	mov rax, 37
	mov qword ptr [rbp - 176], rax
	mov rax, 38
	mov qword ptr [rbp - 152], rax
	mov rax, 39
	mov qword ptr [rbp - 128], rax
	mov rax, 40
	mov qword ptr [rbp - 120], rax
	mov rax, 41
	mov qword ptr [rbp - 64], rax
	mov rax, 42
	mov qword ptr [rbp - 40], rax
	mov rax, 43
	mov qword ptr [rbp + 16], rax
	mov rax, 44
	mov qword ptr [rbp + 72], rax
	mov rax, 45
	mov qword ptr [rbp + 136], rax
	mov rax, 46
	mov qword ptr [rbp + 216], rax
	mov rax, 47
	mov qword ptr [rbp + 248], rax
	mov rax, 48
	mov qword ptr [rbp + 312], rax
	mov rax, 49
	mov qword ptr [rbp + 376], rax
	mov rax, 50
	mov qword ptr [rbp + 432], rax
	mov rax, 51
	mov qword ptr [rbp + 464], rax
	mov rax, 52
	mov qword ptr [rbp + 520], rax
	mov rax, 53
	mov qword ptr [rbp + 560], rax
	mov rax, 54
	mov qword ptr [rbp + 592], rax
	mov rax, 55
	mov qword ptr [rbp + 640], rax
	mov rax, 56
	mov qword ptr [rbp + 656], rax
	mov rax, 57
	mov qword ptr [rbp + 720], rax
	mov rax, 58
	mov qword ptr [rbp + 744], rax
	mov rax, 59
	mov qword ptr [rbp + 784], rax
	mov rax, 60
	mov qword ptr [rbp + 816], rax
	mov rax, 61
	mov qword ptr [rbp + 848], rax
	mov rax, 62
	mov qword ptr [rbp + 880], rax
	mov rax, 63
	mov qword ptr [rbp + 928], rax
	mov rax, 64
	mov qword ptr [rbp + 968], rax
	mov rax, 65
	mov qword ptr [rbp + 1016], rax
	mov rax, 66
	mov qword ptr [rbp + 1192], rax
	mov rax, 67
	mov qword ptr [rbp + 1216], rax
	mov rax, 68
	mov qword ptr [rbp + 1256], rax
	mov rax, 69
	mov qword ptr [rbp + 1408], rax
	mov rax, 70
	mov qword ptr [rbp + 1432], rax
	mov rax, 71
	mov qword ptr [rbp + 1584], rax
	mov rax, 72
	mov qword ptr [rbp + 1608], rax
	mov rax, 73
	mov qword ptr [rbp + 1672], rax
	mov rax, 74
	mov qword ptr [rbp + 1712], rax
	mov rax, 75
	mov qword ptr [rbp + 1752], rax
	mov rax, 76
	mov qword ptr [rbp + 1800], rax
	mov rax, 77
	mov qword ptr [rbp + 1832], rax
	mov rax, 78
	mov qword ptr [rbp + 1872], rax
	mov rax, 79
	mov qword ptr [rbp + 1896], rax
	mov rax, 80
	mov qword ptr [rbp + 1936], rax
	mov rax, 81
	mov qword ptr [rbp + 1992], rax
	mov rax, 82
	mov qword ptr [rbp + 2032], rax
	mov rax, 83
	mov qword ptr [rbp + 2088], rax
	mov rax, 84
	mov qword ptr [rbp + 2144], rax
	mov rax, 85
	mov qword ptr [rbp + 2192], rax
	mov rax, 86
	mov qword ptr [rbp + 2248], rax
	mov rax, 87
	mov qword ptr [rbp + 2312], rax
	mov rax, 88
	mov qword ptr [rbp + 2384], rax
	mov rax, 89
	mov qword ptr [rbp + 2472], rax
	mov rax, 90
	mov qword ptr [rbp + 2528], rax
	mov rax, 91
	mov qword ptr [rbp + 2600], rax
	mov rax, 92
	mov qword ptr [rbp + 2656], rax
	mov rax, 93
	mov qword ptr [rbp + 2696], rax
	mov rax, 94
	mov qword ptr [rbp + 2768], rax
	mov rax, 95
	mov qword ptr [rbp + 2840], rax
	mov rax, 96
	mov qword ptr [rbp + 2880], rax
	mov rax, 97
	mov qword ptr [rbp + 2944], rax
	mov rax, 98
	mov qword ptr [rbp + 3008], rax
	mov rax, 99
	mov qword ptr [rbp + 3064], rax
	mov rax, 100
	mov qword ptr [rbp + 3136], rax
	mov rax, 101
	mov qword ptr [rbp + 3200], rax
	mov rax, 102
	mov qword ptr [rbp + 3272], rax
	mov rax, 103
	mov qword ptr [rbp + 3328], rax
	mov rax, 104
	mov qword ptr [rbp + 3392], rax
	mov rax, 105
	mov qword ptr [rbp + 3464], rax
	mov rax, 106
	mov qword ptr [rbp + 3544], rax
	mov rax, 107
	mov qword ptr [rbp + 3624], rax
	mov rax, 108
	mov qword ptr [rbp + 3688], rax
	mov rax, 109
	mov qword ptr [rbp + 3760], rax
	mov rax, 110
	mov qword ptr [rbp + 3808], rax
	mov rax, 111
	mov qword ptr [rbp + 3880], rax
	mov rax, 112
	mov qword ptr [rbp + 3936], rax
	mov rax, 113
	mov qword ptr [rbp + 4024], rax
	mov rax, 114
	mov qword ptr [rbp + 4096], rax
	mov rax, 115
	mov qword ptr [rbp + 4152], rax
	mov rax, 116
	mov qword ptr [rbp + 4232], rax
	mov rax, 117
	mov qword ptr [rbp + 4296], rax
	mov rax, 118
	mov qword ptr [rbp + 4368], rax
	mov rax, 119
	mov qword ptr [rbp + 4448], rax
	mov rax, 120
	mov qword ptr [rbp + 4528], rax
	mov rax, 121
	mov qword ptr [rbp + 4592], rax
	mov rax, 122
	mov qword ptr [rbp + 4672], rax
	mov rax, 123
	mov qword ptr [rbp + 4744], rax
	mov rax, 124
	mov qword ptr [rbp + 4808], rax
	mov rax, 125
	mov qword ptr [rbp + 4888], rax
	mov rax, 126
	mov qword ptr [rbp + 4960], rax
	mov rax, 127
	mov qword ptr [rbp + 5048], rax
	mov rax, 128
	mov qword ptr [rbp + 5112], rax
	mov rax, 129
	mov qword ptr [rbp + 5176], rax
	mov rax, 130
	mov qword ptr [rbp + 5248], rax
	mov rax, 131
	mov qword ptr [rbp + 5304], rax
	mov rax, 132
	mov qword ptr [rbp + 5392], rax
	mov rax, 133
	mov qword ptr [rbp + 5472], rax
	mov rax, 134
	mov qword ptr [rbp + 5560], rax
	mov rax, 135
	mov qword ptr [rbp + 5576], rax
	mov rax, 136
	mov qword ptr [rbp + 5640], rax
	mov rax, 137
	mov qword ptr [rbp + 5696], rax
	mov rax, 138
	mov qword ptr [rbp + 5760], rax
	mov rax, 139
	mov qword ptr [rbp + 5840], rax
	mov rax, 140
	mov qword ptr [rbp + 5912], rax
	mov rax, 141
	mov qword ptr [rbp + 5984], rax
	mov rax, 142
	mov qword ptr [rbp + 6064], rax
	mov rax, 143
	mov qword ptr [rbp + 6136], rax
	mov rax, 144
	mov qword ptr [rbp + 6200], rax
	mov rax, 145
	mov qword ptr [rbp + 6272], rax
	mov rax, 146
	mov qword ptr [rbp + 6352], rax
	mov rax, 147
	mov qword ptr [rbp + 6424], rax
	mov rax, 148
	mov qword ptr [rbp + 6496], rax
	mov rax, 149
	mov qword ptr [rbp + 6544], rax
	mov rax, 150
	mov qword ptr [rbp + 6648], rax
	mov rax, 151
	mov qword ptr [rbp + 6720], rax
	mov rax, 152
	mov qword ptr [rbp + 6792], rax
	mov rax, 153
	mov qword ptr [rbp + 6864], rax
	mov rax, 154
	mov qword ptr [rbp + 6928], rax
	mov rax, 155
	mov qword ptr [rbp + 6992], rax
	mov rax, 156
	mov qword ptr [rbp + 7064], rax
	mov rax, 157
	mov qword ptr [rbp + 7128], rax
	mov rax, 158
	mov qword ptr [rbp + 7208], rax
	mov rax, 159
	mov qword ptr [rbp + 7272], rax
	mov rax, 160
	mov qword ptr [rbp + 7336], rax
	mov rax, 161
	mov qword ptr [rbp + 7416], rax
	mov rax, 162
	mov qword ptr [rbp + 7472], rax
	mov rax, 163
	mov qword ptr [rbp + 7544], rax
	mov rax, 164
	mov qword ptr [rbp + 7608], rax
	mov rax, 165
	mov qword ptr [rbp + 7680], rax
	mov rax, 166
	mov qword ptr [rbp + 7744], rax
	mov rax, 167
	mov qword ptr [rbp + 7816], rax
	mov rax, 168
	mov qword ptr [rbp + 7896], rax
	mov rax, 169
	mov qword ptr [rbp + 7952], rax
	mov rax, 170
	mov qword ptr [rbp + 8008], rax
	mov rax, 171
	mov qword ptr [rbp + 8056], rax
	mov rax, 172
	mov qword ptr [rbp + 8136], rax
	mov rax, 173
	mov qword ptr [rbp + 8200], rax
	mov rax, 174
	mov qword ptr [rbp + 8264], rax
	mov rax, 175
	mov qword ptr [rbp + 8344], rax
	mov rax, 176
	mov qword ptr [rbp + 8416], rax
	mov rax, 177
	mov qword ptr [rbp + 8472], rax
	mov rax, 178
	mov qword ptr [rbp + 8576], rax
	mov rax, 179
	mov qword ptr [rbp + 8640], rax
	mov rax, 180
	mov qword ptr [rbp + 8712], rax
	mov rax, 181
	mov qword ptr [rbp + 8776], rax
	mov rax, 182
	mov qword ptr [rbp + 8840], rax
	mov rax, 183
	mov qword ptr [rbp + 8912], rax
	mov rax, 184
	mov qword ptr [rbp + 8984], rax
	mov rax, 185
	mov qword ptr [rbp + 9056], rax
	mov rax, 186
	mov qword ptr [rbp + 9120], rax
	mov rax, 187
	mov qword ptr [rbp + 9184], rax
	mov rax, 188
	mov qword ptr [rbp + 9256], rax
	mov rax, 189
	mov qword ptr [rbp + 9320], rax
	mov rax, 190
	mov qword ptr [rbp + 9376], rax
	mov rax, 191
	mov qword ptr [rbp + 9456], rax
	mov rax, 192
	mov qword ptr [rbp + 9528], rax
	mov rax, 193
	mov qword ptr [rbp + 9600], rax
	mov rax, 194
	mov qword ptr [rbp + 9656], rax
	mov rax, 195
	mov qword ptr [rbp + 9728], rax
	mov rax, 196
	mov qword ptr [rbp + 9800], rax
	mov rax, 197
	mov qword ptr [rbp + 9872], rax
	mov rax, 198
	mov qword ptr [rbp + 9944], rax
	mov rax, 199
	mov qword ptr [rbp + 10008], rax
	mov rax, 200
	mov qword ptr [rbp + 10080], rax
	mov rax, 201
	mov qword ptr [rbp + 10160], rax
	mov rax, 202
	mov qword ptr [rbp + 10224], rax
	mov rax, 203
	mov qword ptr [rbp + 10304], rax
	mov rax, 204
	mov qword ptr [rbp + 10376], rax
	mov rax, 205
	mov qword ptr [rbp + 10440], rax
	mov rax, 206
	mov qword ptr [rbp + 10512], rax
	mov rax, 207
	mov qword ptr [rbp + 10624], rax
	mov rax, 208
	mov qword ptr [rbp + 10688], rax
	mov rax, 209
	mov qword ptr [rbp + 10768], rax
	mov rax, 210
	mov qword ptr [rbp + 10856], rax
	mov rax, 211
	mov qword ptr [rbp + 10944], rax
	mov rax, 212
	mov qword ptr [rbp + 11024], rax
	mov rax, 213
	mov qword ptr [rbp + 11104], rax
	mov rax, 214
	mov qword ptr [rbp + 11192], rax
	mov rax, 215
	mov qword ptr [rbp + 11288], rax
	mov rax, 216
	mov qword ptr [rbp + 11400], rax
	mov rax, 217
	mov qword ptr [rbp + 11480], rax
	mov rax, 218
	mov qword ptr [rbp + 11544], rax
	mov rax, 219
	mov qword ptr [rbp + 11608], rax
	mov rax, 220
	mov qword ptr [rbp + 11672], rax
	mov rax, 221
	mov qword ptr [rbp + 11752], rax
	mov rax, 222
	mov qword ptr [rbp + 11824], rax
	mov rax, 223
	mov qword ptr [rbp + 11880], rax
	mov rax, 224
	mov qword ptr [rbp + 11944], rax
	mov rax, 225
	mov qword ptr [rbp + 12008], rax
	mov rax, 226
	mov qword ptr [rbp + 12088], rax
	mov rax, 227
	mov qword ptr [rbp + 12152], rax
	mov rax, 228
	mov qword ptr [rbp + 12232], rax
	mov rax, 229
	mov qword ptr [rbp + 12320], rax
	mov rax, 230
	mov qword ptr [rbp + 12392], rax
	mov rax, 231
	mov qword ptr [rbp + 12464], rax
	mov rax, 232
	mov qword ptr [rbp + 12544], rax
	mov rax, 233
	mov qword ptr [rbp + 12616], rax
	mov rax, 234
	mov qword ptr [rbp + 12696], rax
	mov rax, 235
	mov qword ptr [rbp + 12784], rax
	mov rax, 236
	mov qword ptr [rbp + 12864], rax
	mov rax, 237
	mov qword ptr [rbp + 12936], rax
	mov rax, 238
	mov qword ptr [rbp + 13008], rax
	mov rax, 239
	mov qword ptr [rbp + 13088], rax
	mov rax, 240
	mov qword ptr [rbp + 13160], rax
	mov rax, 241
	mov qword ptr [rbp + 13248], rax
	mov rax, 242
	mov qword ptr [rbp + 13328], rax
	mov rax, 243
	mov qword ptr [rbp + 13400], rax
	mov rax, 244
	mov qword ptr [rbp + 13488], rax
	mov rax, 245
	mov qword ptr [rbp + 13560], rax
	mov rax, 246
	mov qword ptr [rbp + 13640], rax
	mov rax, 247
	mov qword ptr [rbp + 13720], rax
	mov rax, 248
	mov qword ptr [rbp + 13800], rax
	mov rax, 249
	mov qword ptr [rbp + 13864], rax
	mov rax, 250
	mov qword ptr [rbp + 13960], rax
	mov rax, 251
	mov qword ptr [rbp + 14032], rax
	mov rax, 252
	mov qword ptr [rbp + 14088], rax
	mov rax, 253
	mov qword ptr [rbp + 14128], rax
	mov rax, 254
	mov qword ptr [rbp + 14272], rax
	mov rax, 255
	mov qword ptr [rbp + 14376], rax
	mov rax, 256
	mov qword ptr [rbp + 14464], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2064], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 1936], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1840], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1776], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1720], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1664], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1600], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1560], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1488], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1424], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1360], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1312], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1256], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1200], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1136], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 1072], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 1008], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 952], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 896], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 856], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 800], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 752], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 712], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 656], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 600], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 544], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 512], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 472], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 424], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp - 328], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp - 296], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp - 256], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp - 224], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp - 176], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp - 152], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp - 128], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp - 120], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp - 64], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp - 40], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 16], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 72], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 136], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 216], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 248], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 312], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 376], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 432], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 464], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 520], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 560], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 592], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 640], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 656], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 720], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 744], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 784], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 816], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 848], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 880], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 928], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 968], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 1016], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 1192], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 1216], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 1256], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 1408], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 1432], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 1584], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 1608], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 1672], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 1712], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 1752], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 1800], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 1832], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 1872], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 1896], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 1936], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 1992], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 2032], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 2088], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 2144], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 2192], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 2248], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 2312], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 2384], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 2472], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 2528], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 2600], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 2656], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 2696], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 2768], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 2840], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 2880], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 2944], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 3008], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 3064], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 3136], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 3200], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 3272], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 3328], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 3392], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 3464], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 3544], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 3624], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 3688], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 3760], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 3808], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 3880], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 3936], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 4024], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 4096], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 4152], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 4232], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 4296], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 4368], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 4448], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 4528], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 4592], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 4672], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 4744], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 4808], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 4888], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 4960], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 5048], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 5112], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 5176], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 5248], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 5304], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 5392], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 5472], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 5560], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 5576], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 5640], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 5696], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 5760], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 5840], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 5912], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 5984], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 6064], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 6136], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 6200], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 6272], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 6352], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 6424], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 6496], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 6544], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 6648], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 6720], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 6792], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 6864], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 6928], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 6992], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 7064], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 7128], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 7208], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 7272], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 7336], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 7416], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 7472], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 7544], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 7608], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 7680], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 7744], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 7816], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 7896], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 7952], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 8008], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 8056], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 8136], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 8200], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 8264], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 8344], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 8416], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 8472], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 8576], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 8640], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 8712], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 8776], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 8840], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 8912], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 8984], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 9056], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 9120], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 9184], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 9256], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 9320], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 9376], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 9456], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 9528], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 9600], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 9656], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 9728], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 9800], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 9872], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 9944], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 10008], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 10080], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 10160], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 10224], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 10304], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 10376], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 10440], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 10512], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 10624], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 10688], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 10768], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 10856], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 10944], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 11024], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 11104], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 11192], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 11288], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 11400], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 11480], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 11544], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 11608], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 11672], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 11752], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 11824], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 11880], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 11944], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 12008], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 12088], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 12152], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 12232], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 12320], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 12392], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 12464], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 12544], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 12616], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 12696], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 12784], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 12864], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 12936], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 13008], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 13088], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 13160], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 13248], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 13328], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 13400], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 13488], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 13560], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 13640], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 13720], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 13800], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 13864], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 13960], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 14032], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 14088], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 14128], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 14272], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 14376], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 14464], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f9:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2080]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 1904]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1824]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1768]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1728]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1656]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1584]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1520]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1456]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1384]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1336]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1272]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1184]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1128]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1040]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 984]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 920]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 864]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 784]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 728]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 664]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 560]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 496]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 416]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 352]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 272]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 216]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 152]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 88]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp - 40]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp + 16]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp + 96]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp + 160]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp + 224]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp + 272]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp + 344]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp + 400]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 464]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 544]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 608]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 664]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 728]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 808]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 872]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 944]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 1000]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 1072]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 1128]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 1168]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 1208]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 1384]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 1400]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 1576]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 1632]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 1720]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 1784]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 1848]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 1904]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 1968]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 2048]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 2136]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 2216]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 2296]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 2336]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 2416]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 2488]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 2552]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2608]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2664]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 2736]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 2824]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 2912]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 2968]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 3040]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 3112]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 3184]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 3264]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 3336]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 3424]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 3520]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 3592]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 3664]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 3736]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 3824]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 3888]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 3984]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 4048]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 4176]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 4264]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 4336]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 4424]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 4496]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 4576]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 4648]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 4728]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 4792]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 4864]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 4944]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 5016]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 5080]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 5160]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 5256]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 5320]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 5408]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 5488]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 5592]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 5648]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 5736]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 5816]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 5904]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 6000]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 6080]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 6152]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 6240]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 6320]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 6408]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 6488]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 6568]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 6688]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 6752]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 6832]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 6912]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 7000]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 7080]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 7144]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 7232]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 7304]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 7384]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 7464]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 7536]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 7616]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 7688]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 7752]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 7840]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 7904]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 7968]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 8032]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 8096]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 8168]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 8248]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 8320]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 8384]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 8488]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 8560]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 8648]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 8720]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 8800]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 8880]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 8968]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 9048]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 9128]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 9208]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 9288]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 9368]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 9432]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 9512]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 9592]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 9664]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 9736]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 9808]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 9888]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 9960]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 10032]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 10096]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 10176]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 10272]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 10352]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 10400]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 10480]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 10552]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 10640]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 10744]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 10840]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 10912]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 11000]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 11088]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 11184]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 11296]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 11368]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 11456]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 11536]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 11624]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 11704]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 11768]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 11848]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 11936]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 12000]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 12072]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 12160]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 12240]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 12312]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 12408]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 12480]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 12576]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 12656]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 12744]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 12800]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 12880]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 12960]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 13040]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 13120]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 13208]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 13288]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 13368]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 13440]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 13520]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 13600]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 13688]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 13784]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 13872]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 13944]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 14024]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 14120]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 14208]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 14280]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 14360]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 14448]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 14544]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 14584]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 14664]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 14736]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 14816]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 14904]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 14976]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 15048]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 15104]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 15168]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 15256]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 15320]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 15384]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 15448]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 15512]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 15560]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 15640]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 15696]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 15768]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 15840]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 15888]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 15960]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 16032]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 16104]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 16168]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 16232]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 16288]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 16328]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 16384]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 16440]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 16496]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 16552]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 16616]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 16664]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 16696]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 16744]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2080], rax
	mov rax, 5
	mov qword ptr [rbp - 1904], rax
	mov rax, 6
	mov qword ptr [rbp - 1824], rax
	mov rax, 7
	mov qword ptr [rbp - 1768], rax
	mov rax, 8
	mov qword ptr [rbp - 1728], rax
	mov rax, 9
	mov qword ptr [rbp - 1656], rax
	mov rax, 10
	mov qword ptr [rbp - 1584], rax
	mov rax, 11
	mov qword ptr [rbp - 1520], rax
	mov rax, 12
	mov qword ptr [rbp - 1456], rax
	mov rax, 13
	mov qword ptr [rbp - 1384], rax
	mov rax, 14
	mov qword ptr [rbp - 1336], rax
	mov rax, 15
	mov qword ptr [rbp - 1272], rax
	mov rax, 16
	mov qword ptr [rbp - 1184], rax
	mov rax, 17
	mov qword ptr [rbp - 1128], rax
	mov rax, 18
	mov qword ptr [rbp - 1040], rax
	mov rax, 19
	mov qword ptr [rbp - 984], rax
	mov rax, 20
	mov qword ptr [rbp - 920], rax
	mov rax, 21
	mov qword ptr [rbp - 864], rax
	mov rax, 22
	mov qword ptr [rbp - 784], rax
	mov rax, 23
	mov qword ptr [rbp - 728], rax
	mov rax, 24
	mov qword ptr [rbp - 664], rax
	mov rax, 25
	mov qword ptr [rbp - 560], rax
	mov rax, 26
	mov qword ptr [rbp - 496], rax
	mov rax, 27
	mov qword ptr [rbp - 416], rax
	mov rax, 28
	mov qword ptr [rbp - 352], rax
	mov rax, 29
	mov qword ptr [rbp - 272], rax
	mov rax, 30
	mov qword ptr [rbp - 216], rax
	mov rax, 31
	mov qword ptr [rbp - 152], rax
	mov rax, 32
	mov qword ptr [rbp - 88], rax
	mov rax, 33
	mov qword ptr [rbp - 40], rax
	mov rax, 34
	mov qword ptr [rbp + 16], rax
	mov rax, 35
	mov qword ptr [rbp + 96], rax
	mov rax, 36
	mov qword ptr [rbp + 160], rax
	mov rax, 37
	mov qword ptr [rbp + 224], rax
	mov rax, 38
	mov qword ptr [rbp + 272], rax
	mov rax, 39
	mov qword ptr [rbp + 344], rax
	mov rax, 40
	mov qword ptr [rbp + 400], rax
	mov rax, 41
	mov qword ptr [rbp + 464], rax
	mov rax, 42
	mov qword ptr [rbp + 544], rax
	mov rax, 43
	mov qword ptr [rbp + 608], rax
	mov rax, 44
	mov qword ptr [rbp + 664], rax
	mov rax, 45
	mov qword ptr [rbp + 728], rax
	mov rax, 46
	mov qword ptr [rbp + 808], rax
	mov rax, 47
	mov qword ptr [rbp + 872], rax
	mov rax, 48
	mov qword ptr [rbp + 944], rax
	mov rax, 49
	mov qword ptr [rbp + 1000], rax
	mov rax, 50
	mov qword ptr [rbp + 1072], rax
	mov rax, 51
	mov qword ptr [rbp + 1128], rax
	mov rax, 52
	mov qword ptr [rbp + 1168], rax
	mov rax, 53
	mov qword ptr [rbp + 1208], rax
	mov rax, 54
	mov qword ptr [rbp + 1384], rax
	mov rax, 55
	mov qword ptr [rbp + 1400], rax
	mov rax, 56
	mov qword ptr [rbp + 1576], rax
	mov rax, 57
	mov qword ptr [rbp + 1632], rax
	mov rax, 58
	mov qword ptr [rbp + 1720], rax
	mov rax, 59
	mov qword ptr [rbp + 1784], rax
	mov rax, 60
	mov qword ptr [rbp + 1848], rax
	mov rax, 61
	mov qword ptr [rbp + 1904], rax
	mov rax, 62
	mov qword ptr [rbp + 1968], rax
	mov rax, 63
	mov qword ptr [rbp + 2048], rax
	mov rax, 64
	mov qword ptr [rbp + 2136], rax
	mov rax, 65
	mov qword ptr [rbp + 2216], rax
	mov rax, 66
	mov qword ptr [rbp + 2296], rax
	mov rax, 67
	mov qword ptr [rbp + 2336], rax
	mov rax, 68
	mov qword ptr [rbp + 2416], rax
	mov rax, 69
	mov qword ptr [rbp + 2488], rax
	mov rax, 70
	mov qword ptr [rbp + 2552], rax
	mov rax, 71
	mov qword ptr [rbp + 2608], rax
	mov rax, 72
	mov qword ptr [rbp + 2664], rax
	mov rax, 73
	mov qword ptr [rbp + 2736], rax
	mov rax, 74
	mov qword ptr [rbp + 2824], rax
	mov rax, 75
	mov qword ptr [rbp + 2912], rax
	mov rax, 76
	mov qword ptr [rbp + 2968], rax
	mov rax, 77
	mov qword ptr [rbp + 3040], rax
	mov rax, 78
	mov qword ptr [rbp + 3112], rax
	mov rax, 79
	mov qword ptr [rbp + 3184], rax
	mov rax, 80
	mov qword ptr [rbp + 3264], rax
	mov rax, 81
	mov qword ptr [rbp + 3336], rax
	mov rax, 82
	mov qword ptr [rbp + 3424], rax
	mov rax, 83
	mov qword ptr [rbp + 3520], rax
	mov rax, 84
	mov qword ptr [rbp + 3592], rax
	mov rax, 85
	mov qword ptr [rbp + 3664], rax
	mov rax, 86
	mov qword ptr [rbp + 3736], rax
	mov rax, 87
	mov qword ptr [rbp + 3824], rax
	mov rax, 88
	mov qword ptr [rbp + 3888], rax
	mov rax, 89
	mov qword ptr [rbp + 3984], rax
	mov rax, 90
	mov qword ptr [rbp + 4048], rax
	mov rax, 91
	mov qword ptr [rbp + 4176], rax
	mov rax, 92
	mov qword ptr [rbp + 4264], rax
	mov rax, 93
	mov qword ptr [rbp + 4336], rax
	mov rax, 94
	mov qword ptr [rbp + 4424], rax
	mov rax, 95
	mov qword ptr [rbp + 4496], rax
	mov rax, 96
	mov qword ptr [rbp + 4576], rax
	mov rax, 97
	mov qword ptr [rbp + 4648], rax
	mov rax, 98
	mov qword ptr [rbp + 4728], rax
	mov rax, 99
	mov qword ptr [rbp + 4792], rax
	mov rax, 100
	mov qword ptr [rbp + 4864], rax
	mov rax, 101
	mov qword ptr [rbp + 4944], rax
	mov rax, 102
	mov qword ptr [rbp + 5016], rax
	mov rax, 103
	mov qword ptr [rbp + 5080], rax
	mov rax, 104
	mov qword ptr [rbp + 5160], rax
	mov rax, 105
	mov qword ptr [rbp + 5256], rax
	mov rax, 106
	mov qword ptr [rbp + 5320], rax
	mov rax, 107
	mov qword ptr [rbp + 5408], rax
	mov rax, 108
	mov qword ptr [rbp + 5488], rax
	mov rax, 109
	mov qword ptr [rbp + 5592], rax
	mov rax, 110
	mov qword ptr [rbp + 5648], rax
	mov rax, 111
	mov qword ptr [rbp + 5736], rax
	mov rax, 112
	mov qword ptr [rbp + 5816], rax
	mov rax, 113
	mov qword ptr [rbp + 5904], rax
	mov rax, 114
	mov qword ptr [rbp + 6000], rax
	mov rax, 115
	mov qword ptr [rbp + 6080], rax
	mov rax, 116
	mov qword ptr [rbp + 6152], rax
	mov rax, 117
	mov qword ptr [rbp + 6240], rax
	mov rax, 118
	mov qword ptr [rbp + 6320], rax
	mov rax, 119
	mov qword ptr [rbp + 6408], rax
	mov rax, 120
	mov qword ptr [rbp + 6488], rax
	mov rax, 121
	mov qword ptr [rbp + 6568], rax
	mov rax, 122
	mov qword ptr [rbp + 6688], rax
	mov rax, 123
	mov qword ptr [rbp + 6752], rax
	mov rax, 124
	mov qword ptr [rbp + 6832], rax
	mov rax, 125
	mov qword ptr [rbp + 6912], rax
	mov rax, 126
	mov qword ptr [rbp + 7000], rax
	mov rax, 127
	mov qword ptr [rbp + 7080], rax
	mov rax, 128
	mov qword ptr [rbp + 7144], rax
	mov rax, 129
	mov qword ptr [rbp + 7232], rax
	mov rax, 130
	mov qword ptr [rbp + 7304], rax
	mov rax, 131
	mov qword ptr [rbp + 7384], rax
	mov rax, 132
	mov qword ptr [rbp + 7464], rax
	mov rax, 133
	mov qword ptr [rbp + 7536], rax
	mov rax, 134
	mov qword ptr [rbp + 7616], rax
	mov rax, 135
	mov qword ptr [rbp + 7688], rax
	mov rax, 136
	mov qword ptr [rbp + 7752], rax
	mov rax, 137
	mov qword ptr [rbp + 7840], rax
	mov rax, 138
	mov qword ptr [rbp + 7904], rax
	mov rax, 139
	mov qword ptr [rbp + 7968], rax
	mov rax, 140
	mov qword ptr [rbp + 8032], rax
	mov rax, 141
	mov qword ptr [rbp + 8096], rax
	mov rax, 142
	mov qword ptr [rbp + 8168], rax
	mov rax, 143
	mov qword ptr [rbp + 8248], rax
	mov rax, 144
	mov qword ptr [rbp + 8320], rax
	mov rax, 145
	mov qword ptr [rbp + 8384], rax
	mov rax, 146
	mov qword ptr [rbp + 8488], rax
	mov rax, 147
	mov qword ptr [rbp + 8560], rax
	mov rax, 148
	mov qword ptr [rbp + 8648], rax
	mov rax, 149
	mov qword ptr [rbp + 8720], rax
	mov rax, 150
	mov qword ptr [rbp + 8800], rax
	mov rax, 151
	mov qword ptr [rbp + 8880], rax
	mov rax, 152
	mov qword ptr [rbp + 8968], rax
	mov rax, 153
	mov qword ptr [rbp + 9048], rax
	mov rax, 154
	mov qword ptr [rbp + 9128], rax
	mov rax, 155
	mov qword ptr [rbp + 9208], rax
	mov rax, 156
	mov qword ptr [rbp + 9288], rax
	mov rax, 157
	mov qword ptr [rbp + 9368], rax
	mov rax, 158
	mov qword ptr [rbp + 9432], rax
	mov rax, 159
	mov qword ptr [rbp + 9512], rax
	mov rax, 160
	mov qword ptr [rbp + 9592], rax
	mov rax, 161
	mov qword ptr [rbp + 9664], rax
	mov rax, 162
	mov qword ptr [rbp + 9736], rax
	mov rax, 163
	mov qword ptr [rbp + 9808], rax
	mov rax, 164
	mov qword ptr [rbp + 9888], rax
	mov rax, 165
	mov qword ptr [rbp + 9960], rax
	mov rax, 166
	mov qword ptr [rbp + 10032], rax
	mov rax, 167
	mov qword ptr [rbp + 10096], rax
	mov rax, 168
	mov qword ptr [rbp + 10176], rax
	mov rax, 169
	mov qword ptr [rbp + 10272], rax
	mov rax, 170
	mov qword ptr [rbp + 10352], rax
	mov rax, 171
	mov qword ptr [rbp + 10400], rax
	mov rax, 172
	mov qword ptr [rbp + 10480], rax
	mov rax, 173
	mov qword ptr [rbp + 10552], rax
	mov rax, 174
	mov qword ptr [rbp + 10640], rax
	mov rax, 175
	mov qword ptr [rbp + 10744], rax
	mov rax, 176
	mov qword ptr [rbp + 10840], rax
	mov rax, 177
	mov qword ptr [rbp + 10912], rax
	mov rax, 178
	mov qword ptr [rbp + 11000], rax
	mov rax, 179
	mov qword ptr [rbp + 11088], rax
	mov rax, 180
	mov qword ptr [rbp + 11184], rax
	mov rax, 181
	mov qword ptr [rbp + 11296], rax
	mov rax, 182
	mov qword ptr [rbp + 11368], rax
	mov rax, 183
	mov qword ptr [rbp + 11456], rax
	mov rax, 184
	mov qword ptr [rbp + 11536], rax
	mov rax, 185
	mov qword ptr [rbp + 11624], rax
	mov rax, 186
	mov qword ptr [rbp + 11704], rax
	mov rax, 187
	mov qword ptr [rbp + 11768], rax
	mov rax, 188
	mov qword ptr [rbp + 11848], rax
	mov rax, 189
	mov qword ptr [rbp + 11936], rax
	mov rax, 190
	mov qword ptr [rbp + 12000], rax
	mov rax, 191
	mov qword ptr [rbp + 12072], rax
	mov rax, 192
	mov qword ptr [rbp + 12160], rax
	mov rax, 193
	mov qword ptr [rbp + 12240], rax
	mov rax, 194
	mov qword ptr [rbp + 12312], rax
	mov rax, 195
	mov qword ptr [rbp + 12408], rax
	mov rax, 196
	mov qword ptr [rbp + 12480], rax
	mov rax, 197
	mov qword ptr [rbp + 12576], rax
	mov rax, 198
	mov qword ptr [rbp + 12656], rax
	mov rax, 199
	mov qword ptr [rbp + 12744], rax
	mov rax, 200
	mov qword ptr [rbp + 12800], rax
	mov rax, 201
	mov qword ptr [rbp + 12880], rax
	mov rax, 202
	mov qword ptr [rbp + 12960], rax
	mov rax, 203
	mov qword ptr [rbp + 13040], rax
	mov rax, 204
	mov qword ptr [rbp + 13120], rax
	mov rax, 205
	mov qword ptr [rbp + 13208], rax
	mov rax, 206
	mov qword ptr [rbp + 13288], rax
	mov rax, 207
	mov qword ptr [rbp + 13368], rax
	mov rax, 208
	mov qword ptr [rbp + 13440], rax
	mov rax, 209
	mov qword ptr [rbp + 13520], rax
	mov rax, 210
	mov qword ptr [rbp + 13600], rax
	mov rax, 211
	mov qword ptr [rbp + 13688], rax
	mov rax, 212
	mov qword ptr [rbp + 13784], rax
	mov rax, 213
	mov qword ptr [rbp + 13872], rax
	mov rax, 214
	mov qword ptr [rbp + 13944], rax
	mov rax, 215
	mov qword ptr [rbp + 14024], rax
	mov rax, 216
	mov qword ptr [rbp + 14120], rax
	mov rax, 217
	mov qword ptr [rbp + 14208], rax
	mov rax, 218
	mov qword ptr [rbp + 14280], rax
	mov rax, 219
	mov qword ptr [rbp + 14360], rax
	mov rax, 220
	mov qword ptr [rbp + 14448], rax
	mov rax, 221
	mov qword ptr [rbp + 14544], rax
	mov rax, 222
	mov qword ptr [rbp + 14584], rax
	mov rax, 223
	mov qword ptr [rbp + 14664], rax
	mov rax, 224
	mov qword ptr [rbp + 14736], rax
	mov rax, 225
	mov qword ptr [rbp + 14816], rax
	mov rax, 226
	mov qword ptr [rbp + 14904], rax
	mov rax, 227
	mov qword ptr [rbp + 14976], rax
	mov rax, 228
	mov qword ptr [rbp + 15048], rax
	mov rax, 229
	mov qword ptr [rbp + 15104], rax
	mov rax, 230
	mov qword ptr [rbp + 15168], rax
	mov rax, 231
	mov qword ptr [rbp + 15256], rax
	mov rax, 232
	mov qword ptr [rbp + 15320], rax
	mov rax, 233
	mov qword ptr [rbp + 15384], rax
	mov rax, 234
	mov qword ptr [rbp + 15448], rax
	mov rax, 235
	mov qword ptr [rbp + 15512], rax
	mov rax, 236
	mov qword ptr [rbp + 15560], rax
	mov rax, 237
	mov qword ptr [rbp + 15640], rax
	mov rax, 238
	mov qword ptr [rbp + 15696], rax
	mov rax, 239
	mov qword ptr [rbp + 15768], rax
	mov rax, 240
	mov qword ptr [rbp + 15840], rax
	mov rax, 241
	mov qword ptr [rbp + 15888], rax
	mov rax, 242
	mov qword ptr [rbp + 15960], rax
	mov rax, 243
	mov qword ptr [rbp + 16032], rax
	mov rax, 244
	mov qword ptr [rbp + 16104], rax
	mov rax, 245
	mov qword ptr [rbp + 16168], rax
	mov rax, 246
	mov qword ptr [rbp + 16232], rax
	mov rax, 247
	mov qword ptr [rbp + 16288], rax
	mov rax, 248
	mov qword ptr [rbp + 16328], rax
	mov rax, 249
	mov qword ptr [rbp + 16384], rax
	mov rax, 250
	mov qword ptr [rbp + 16440], rax
	mov rax, 251
	mov qword ptr [rbp + 16496], rax
	mov rax, 252
	mov qword ptr [rbp + 16552], rax
	mov rax, 253
	mov qword ptr [rbp + 16616], rax
	mov rax, 254
	mov qword ptr [rbp + 16664], rax
	mov rax, 255
	mov qword ptr [rbp + 16696], rax
	mov rax, 256
	mov qword ptr [rbp + 16744], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2080], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 1904], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1824], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1768], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1728], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1656], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1584], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1520], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1456], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1384], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1336], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1272], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1184], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1128], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1040], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 984], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 920], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 864], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 784], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 728], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 664], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 560], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 496], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 416], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 352], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 272], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 216], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 152], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 88], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp - 40], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp + 16], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp + 96], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp + 160], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp + 224], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp + 272], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp + 344], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp + 400], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 464], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 544], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 608], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 664], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 728], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 808], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 872], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 944], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 1000], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 1072], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 1128], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 1168], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 1208], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 1384], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 1400], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 1576], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 1632], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 1720], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 1784], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 1848], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 1904], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 1968], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 2048], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 2136], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 2216], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 2296], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 2336], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 2416], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 2488], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 2552], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2608], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2664], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 2736], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 2824], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 2912], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 2968], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 3040], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 3112], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 3184], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 3264], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 3336], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 3424], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 3520], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 3592], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 3664], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 3736], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 3824], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 3888], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 3984], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 4048], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 4176], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 4264], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 4336], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 4424], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 4496], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 4576], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 4648], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 4728], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 4792], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 4864], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 4944], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 5016], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 5080], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 5160], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 5256], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 5320], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 5408], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 5488], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 5592], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 5648], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 5736], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 5816], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 5904], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 6000], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 6080], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 6152], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 6240], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 6320], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 6408], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 6488], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 6568], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 6688], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 6752], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 6832], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 6912], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 7000], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 7080], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 7144], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 7232], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 7304], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 7384], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 7464], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 7536], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 7616], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 7688], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 7752], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 7840], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 7904], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 7968], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 8032], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 8096], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 8168], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 8248], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 8320], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 8384], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 8488], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 8560], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 8648], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 8720], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 8800], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 8880], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 8968], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 9048], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 9128], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 9208], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 9288], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 9368], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 9432], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 9512], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 9592], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 9664], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 9736], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 9808], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 9888], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 9960], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 10032], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 10096], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 10176], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 10272], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 10352], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 10400], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 10480], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 10552], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 10640], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 10744], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 10840], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 10912], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 11000], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 11088], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 11184], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 11296], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 11368], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 11456], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 11536], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 11624], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 11704], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 11768], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 11848], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 11936], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 12000], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 12072], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 12160], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 12240], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 12312], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 12408], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 12480], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 12576], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 12656], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 12744], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 12800], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 12880], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 12960], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 13040], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 13120], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 13208], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 13288], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 13368], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 13440], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 13520], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 13600], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 13688], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 13784], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 13872], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 13944], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 14024], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 14120], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 14208], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 14280], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 14360], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 14448], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 14544], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 14584], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 14664], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 14736], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 14816], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 14904], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 14976], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 15048], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 15104], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 15168], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 15256], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 15320], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 15384], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 15448], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 15512], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 15560], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 15640], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 15696], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 15768], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 15840], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 15888], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 15960], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 16032], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 16104], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 16168], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 16232], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 16288], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 16328], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 16384], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 16440], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 16496], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 16552], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 16616], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 16664], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 16696], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 16744], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f2:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2056]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 2016]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1968]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1912]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1856]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1760]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1696]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1592]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1552]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1464]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1392]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1344]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1288]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1208]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1120]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 1048]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 976]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 904]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 832]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 760]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 696]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 624]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 576]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 504]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 440]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 368]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 240]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 96]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 40]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp + 32]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp + 80]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp + 152]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp + 232]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp + 280]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp + 320]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp + 392]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp + 480]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 568]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 632]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 688]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 792]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 856]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 936]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 1040]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 1096]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 1144]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 1376]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 1416]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 1440]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 1616]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 1688]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 1760]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 2008]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 2048]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 2096]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 2160]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 2208]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 2256]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 2328]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 2392]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 2448]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 2504]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 2560]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 2624]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 2680]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 2728]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 2792]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2848]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2904]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 2944]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 3000]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 3056]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 3128]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 3192]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 3240]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 3296]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 3368]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 3432]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 3480]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 3544]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 3616]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 3680]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 3864]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 3928]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 4008]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 4064]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 4136]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 4224]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 4280]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 4352]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 4424]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 4480]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 4552]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 4632]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 4696]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 4760]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 4816]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 4880]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 4936]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 5000]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 5072]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 5144]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 5192]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 5264]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 5336]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 5384]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 5464]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 5552]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 5584]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 5624]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 5680]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 5752]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 5824]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 5896]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 5976]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 6032]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 6104]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 6184]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 6248]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 6328]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 6392]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 6472]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 6528]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 6592]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 6656]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 6720]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 6784]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 6840]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 6904]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 6976]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 7056]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 7120]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 7184]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 7264]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 7336]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 7392]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 7448]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 7528]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 7592]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 7664]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 7728]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 7800]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 7848]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 7928]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 7992]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 8048]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 8104]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 8176]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 8256]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 8304]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 8352]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 8432]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 8512]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 8544]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 8608]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 8680]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 8728]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 8808]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 8888]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 8960]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 9024]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 9088]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 9152]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 9200]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 9280]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 9336]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 9416]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 9480]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 9552]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 9608]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 9680]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 9720]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 9792]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 9864]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 9920]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 9992]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 10048]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 10128]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 10200]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 10264]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 10336]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 10392]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 10464]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 10536]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 10600]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 10680]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 10760]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 10848]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 10928]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 10992]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 11080]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 11160]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 11232]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 11320]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 11384]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 11528]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 11616]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 11696]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 11784]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 11864]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 11936]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 12032]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 12104]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 12192]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 12280]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 12368]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 12440]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 12520]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 12592]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 12672]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 12768]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 12848]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 12944]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 13032]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 13104]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 13200]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 13280]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 13360]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 13448]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 13536]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 13624]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 13704]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 13776]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 13880]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 13952]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 14048]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 14152]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 14288]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 14352]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 14440]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 14536]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 14608]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 14672]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 14744]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 14824]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 14912]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 14984]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 15040]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 15112]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 15184]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 15232]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 15296]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 15360]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 15432]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 15504]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 15576]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 15632]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 15704]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 15776]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 15848]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 15920]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 15976]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 16048]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2056], rax
	mov rax, 5
	mov qword ptr [rbp - 2016], rax
	mov rax, 6
	mov qword ptr [rbp - 1968], rax
	mov rax, 7
	mov qword ptr [rbp - 1912], rax
	mov rax, 8
	mov qword ptr [rbp - 1856], rax
	mov rax, 9
	mov qword ptr [rbp - 1760], rax
	mov rax, 10
	mov qword ptr [rbp - 1696], rax
	mov rax, 11
	mov qword ptr [rbp - 1592], rax
	mov rax, 12
	mov qword ptr [rbp - 1552], rax
	mov rax, 13
	mov qword ptr [rbp - 1464], rax
	mov rax, 14
	mov qword ptr [rbp - 1392], rax
	mov rax, 15
	mov qword ptr [rbp - 1344], rax
	mov rax, 16
	mov qword ptr [rbp - 1288], rax
	mov rax, 17
	mov qword ptr [rbp - 1208], rax
	mov rax, 18
	mov qword ptr [rbp - 1120], rax
	mov rax, 19
	mov qword ptr [rbp - 1048], rax
	mov rax, 20
	mov qword ptr [rbp - 976], rax
	mov rax, 21
	mov qword ptr [rbp - 904], rax
	mov rax, 22
	mov qword ptr [rbp - 832], rax
	mov rax, 23
	mov qword ptr [rbp - 760], rax
	mov rax, 24
	mov qword ptr [rbp - 696], rax
	mov rax, 25
	mov qword ptr [rbp - 624], rax
	mov rax, 26
	mov qword ptr [rbp - 576], rax
	mov rax, 27
	mov qword ptr [rbp - 504], rax
	mov rax, 28
	mov qword ptr [rbp - 440], rax
	mov rax, 29
	mov qword ptr [rbp - 368], rax
	mov rax, 30
	mov qword ptr [rbp - 240], rax
	mov rax, 31
	mov qword ptr [rbp - 96], rax
	mov rax, 32
	mov qword ptr [rbp - 40], rax
	mov rax, 33
	mov qword ptr [rbp + 32], rax
	mov rax, 34
	mov qword ptr [rbp + 80], rax
	mov rax, 35
	mov qword ptr [rbp + 152], rax
	mov rax, 36
	mov qword ptr [rbp + 232], rax
	mov rax, 37
	mov qword ptr [rbp + 280], rax
	mov rax, 38
	mov qword ptr [rbp + 320], rax
	mov rax, 39
	mov qword ptr [rbp + 392], rax
	mov rax, 40
	mov qword ptr [rbp + 480], rax
	mov rax, 41
	mov qword ptr [rbp + 568], rax
	mov rax, 42
	mov qword ptr [rbp + 632], rax
	mov rax, 43
	mov qword ptr [rbp + 688], rax
	mov rax, 44
	mov qword ptr [rbp + 792], rax
	mov rax, 45
	mov qword ptr [rbp + 856], rax
	mov rax, 46
	mov qword ptr [rbp + 936], rax
	mov rax, 47
	mov qword ptr [rbp + 1040], rax
	mov rax, 48
	mov qword ptr [rbp + 1096], rax
	mov rax, 49
	mov qword ptr [rbp + 1144], rax
	mov rax, 50
	mov qword ptr [rbp + 1376], rax
	mov rax, 51
	mov qword ptr [rbp + 1416], rax
	mov rax, 52
	mov qword ptr [rbp + 1440], rax
	mov rax, 53
	mov qword ptr [rbp + 1616], rax
	mov rax, 54
	mov qword ptr [rbp + 1688], rax
	mov rax, 55
	mov qword ptr [rbp + 1760], rax
	mov rax, 56
	mov qword ptr [rbp + 2008], rax
	mov rax, 57
	mov qword ptr [rbp + 2048], rax
	mov rax, 58
	mov qword ptr [rbp + 2096], rax
	mov rax, 59
	mov qword ptr [rbp + 2160], rax
	mov rax, 60
	mov qword ptr [rbp + 2208], rax
	mov rax, 61
	mov qword ptr [rbp + 2256], rax
	mov rax, 62
	mov qword ptr [rbp + 2328], rax
	mov rax, 63
	mov qword ptr [rbp + 2392], rax
	mov rax, 64
	mov qword ptr [rbp + 2448], rax
	mov rax, 65
	mov qword ptr [rbp + 2504], rax
	mov rax, 66
	mov qword ptr [rbp + 2560], rax
	mov rax, 67
	mov qword ptr [rbp + 2624], rax
	mov rax, 68
	mov qword ptr [rbp + 2680], rax
	mov rax, 69
	mov qword ptr [rbp + 2728], rax
	mov rax, 70
	mov qword ptr [rbp + 2792], rax
	mov rax, 71
	mov qword ptr [rbp + 2848], rax
	mov rax, 72
	mov qword ptr [rbp + 2904], rax
	mov rax, 73
	mov qword ptr [rbp + 2944], rax
	mov rax, 74
	mov qword ptr [rbp + 3000], rax
	mov rax, 75
	mov qword ptr [rbp + 3056], rax
	mov rax, 76
	mov qword ptr [rbp + 3128], rax
	mov rax, 77
	mov qword ptr [rbp + 3192], rax
	mov rax, 78
	mov qword ptr [rbp + 3240], rax
	mov rax, 79
	mov qword ptr [rbp + 3296], rax
	mov rax, 80
	mov qword ptr [rbp + 3368], rax
	mov rax, 81
	mov qword ptr [rbp + 3432], rax
	mov rax, 82
	mov qword ptr [rbp + 3480], rax
	mov rax, 83
	mov qword ptr [rbp + 3544], rax
	mov rax, 84
	mov qword ptr [rbp + 3616], rax
	mov rax, 85
	mov qword ptr [rbp + 3680], rax
	mov rax, 86
	mov qword ptr [rbp + 3864], rax
	mov rax, 87
	mov qword ptr [rbp + 3928], rax
	mov rax, 88
	mov qword ptr [rbp + 4008], rax
	mov rax, 89
	mov qword ptr [rbp + 4064], rax
	mov rax, 90
	mov qword ptr [rbp + 4136], rax
	mov rax, 91
	mov qword ptr [rbp + 4224], rax
	mov rax, 92
	mov qword ptr [rbp + 4280], rax
	mov rax, 93
	mov qword ptr [rbp + 4352], rax
	mov rax, 94
	mov qword ptr [rbp + 4424], rax
	mov rax, 95
	mov qword ptr [rbp + 4480], rax
	mov rax, 96
	mov qword ptr [rbp + 4552], rax
	mov rax, 97
	mov qword ptr [rbp + 4632], rax
	mov rax, 98
	mov qword ptr [rbp + 4696], rax
	mov rax, 99
	mov qword ptr [rbp + 4760], rax
	mov rax, 100
	mov qword ptr [rbp + 4816], rax
	mov rax, 101
	mov qword ptr [rbp + 4880], rax
	mov rax, 102
	mov qword ptr [rbp + 4936], rax
	mov rax, 103
	mov qword ptr [rbp + 5000], rax
	mov rax, 104
	mov qword ptr [rbp + 5072], rax
	mov rax, 105
	mov qword ptr [rbp + 5144], rax
	mov rax, 106
	mov qword ptr [rbp + 5192], rax
	mov rax, 107
	mov qword ptr [rbp + 5264], rax
	mov rax, 108
	mov qword ptr [rbp + 5336], rax
	mov rax, 109
	mov qword ptr [rbp + 5384], rax
	mov rax, 110
	mov qword ptr [rbp + 5464], rax
	mov rax, 111
	mov qword ptr [rbp + 5552], rax
	mov rax, 112
	mov qword ptr [rbp + 5584], rax
	mov rax, 113
	mov qword ptr [rbp + 5624], rax
	mov rax, 114
	mov qword ptr [rbp + 5680], rax
	mov rax, 115
	mov qword ptr [rbp + 5752], rax
	mov rax, 116
	mov qword ptr [rbp + 5824], rax
	mov rax, 117
	mov qword ptr [rbp + 5896], rax
	mov rax, 118
	mov qword ptr [rbp + 5976], rax
	mov rax, 119
	mov qword ptr [rbp + 6032], rax
	mov rax, 120
	mov qword ptr [rbp + 6104], rax
	mov rax, 121
	mov qword ptr [rbp + 6184], rax
	mov rax, 122
	mov qword ptr [rbp + 6248], rax
	mov rax, 123
	mov qword ptr [rbp + 6328], rax
	mov rax, 124
	mov qword ptr [rbp + 6392], rax
	mov rax, 125
	mov qword ptr [rbp + 6472], rax
	mov rax, 126
	mov qword ptr [rbp + 6528], rax
	mov rax, 127
	mov qword ptr [rbp + 6592], rax
	mov rax, 128
	mov qword ptr [rbp + 6656], rax
	mov rax, 129
	mov qword ptr [rbp + 6720], rax
	mov rax, 130
	mov qword ptr [rbp + 6784], rax
	mov rax, 131
	mov qword ptr [rbp + 6840], rax
	mov rax, 132
	mov qword ptr [rbp + 6904], rax
	mov rax, 133
	mov qword ptr [rbp + 6976], rax
	mov rax, 134
	mov qword ptr [rbp + 7056], rax
	mov rax, 135
	mov qword ptr [rbp + 7120], rax
	mov rax, 136
	mov qword ptr [rbp + 7184], rax
	mov rax, 137
	mov qword ptr [rbp + 7264], rax
	mov rax, 138
	mov qword ptr [rbp + 7336], rax
	mov rax, 139
	mov qword ptr [rbp + 7392], rax
	mov rax, 140
	mov qword ptr [rbp + 7448], rax
	mov rax, 141
	mov qword ptr [rbp + 7528], rax
	mov rax, 142
	mov qword ptr [rbp + 7592], rax
	mov rax, 143
	mov qword ptr [rbp + 7664], rax
	mov rax, 144
	mov qword ptr [rbp + 7728], rax
	mov rax, 145
	mov qword ptr [rbp + 7800], rax
	mov rax, 146
	mov qword ptr [rbp + 7848], rax
	mov rax, 147
	mov qword ptr [rbp + 7928], rax
	mov rax, 148
	mov qword ptr [rbp + 7992], rax
	mov rax, 149
	mov qword ptr [rbp + 8048], rax
	mov rax, 150
	mov qword ptr [rbp + 8104], rax
	mov rax, 151
	mov qword ptr [rbp + 8176], rax
	mov rax, 152
	mov qword ptr [rbp + 8256], rax
	mov rax, 153
	mov qword ptr [rbp + 8304], rax
	mov rax, 154
	mov qword ptr [rbp + 8352], rax
	mov rax, 155
	mov qword ptr [rbp + 8432], rax
	mov rax, 156
	mov qword ptr [rbp + 8512], rax
	mov rax, 157
	mov qword ptr [rbp + 8544], rax
	mov rax, 158
	mov qword ptr [rbp + 8608], rax
	mov rax, 159
	mov qword ptr [rbp + 8680], rax
	mov rax, 160
	mov qword ptr [rbp + 8728], rax
	mov rax, 161
	mov qword ptr [rbp + 8808], rax
	mov rax, 162
	mov qword ptr [rbp + 8888], rax
	mov rax, 163
	mov qword ptr [rbp + 8960], rax
	mov rax, 164
	mov qword ptr [rbp + 9024], rax
	mov rax, 165
	mov qword ptr [rbp + 9088], rax
	mov rax, 166
	mov qword ptr [rbp + 9152], rax
	mov rax, 167
	mov qword ptr [rbp + 9200], rax
	mov rax, 168
	mov qword ptr [rbp + 9280], rax
	mov rax, 169
	mov qword ptr [rbp + 9336], rax
	mov rax, 170
	mov qword ptr [rbp + 9416], rax
	mov rax, 171
	mov qword ptr [rbp + 9480], rax
	mov rax, 172
	mov qword ptr [rbp + 9552], rax
	mov rax, 173
	mov qword ptr [rbp + 9608], rax
	mov rax, 174
	mov qword ptr [rbp + 9680], rax
	mov rax, 175
	mov qword ptr [rbp + 9720], rax
	mov rax, 176
	mov qword ptr [rbp + 9792], rax
	mov rax, 177
	mov qword ptr [rbp + 9864], rax
	mov rax, 178
	mov qword ptr [rbp + 9920], rax
	mov rax, 179
	mov qword ptr [rbp + 9992], rax
	mov rax, 180
	mov qword ptr [rbp + 10048], rax
	mov rax, 181
	mov qword ptr [rbp + 10128], rax
	mov rax, 182
	mov qword ptr [rbp + 10200], rax
	mov rax, 183
	mov qword ptr [rbp + 10264], rax
	mov rax, 184
	mov qword ptr [rbp + 10336], rax
	mov rax, 185
	mov qword ptr [rbp + 10392], rax
	mov rax, 186
	mov qword ptr [rbp + 10464], rax
	mov rax, 187
	mov qword ptr [rbp + 10536], rax
	mov rax, 188
	mov qword ptr [rbp + 10600], rax
	mov rax, 189
	mov qword ptr [rbp + 10680], rax
	mov rax, 190
	mov qword ptr [rbp + 10760], rax
	mov rax, 191
	mov qword ptr [rbp + 10848], rax
	mov rax, 192
	mov qword ptr [rbp + 10928], rax
	mov rax, 193
	mov qword ptr [rbp + 10992], rax
	mov rax, 194
	mov qword ptr [rbp + 11080], rax
	mov rax, 195
	mov qword ptr [rbp + 11160], rax
	mov rax, 196
	mov qword ptr [rbp + 11232], rax
	mov rax, 197
	mov qword ptr [rbp + 11320], rax
	mov rax, 198
	mov qword ptr [rbp + 11384], rax
	mov rax, 199
	mov qword ptr [rbp + 11528], rax
	mov rax, 200
	mov qword ptr [rbp + 11616], rax
	mov rax, 201
	mov qword ptr [rbp + 11696], rax
	mov rax, 202
	mov qword ptr [rbp + 11784], rax
	mov rax, 203
	mov qword ptr [rbp + 11864], rax
	mov rax, 204
	mov qword ptr [rbp + 11936], rax
	mov rax, 205
	mov qword ptr [rbp + 12032], rax
	mov rax, 206
	mov qword ptr [rbp + 12104], rax
	mov rax, 207
	mov qword ptr [rbp + 12192], rax
	mov rax, 208
	mov qword ptr [rbp + 12280], rax
	mov rax, 209
	mov qword ptr [rbp + 12368], rax
	mov rax, 210
	mov qword ptr [rbp + 12440], rax
	mov rax, 211
	mov qword ptr [rbp + 12520], rax
	mov rax, 212
	mov qword ptr [rbp + 12592], rax
	mov rax, 213
	mov qword ptr [rbp + 12672], rax
	mov rax, 214
	mov qword ptr [rbp + 12768], rax
	mov rax, 215
	mov qword ptr [rbp + 12848], rax
	mov rax, 216
	mov qword ptr [rbp + 12944], rax
	mov rax, 217
	mov qword ptr [rbp + 13032], rax
	mov rax, 218
	mov qword ptr [rbp + 13104], rax
	mov rax, 219
	mov qword ptr [rbp + 13200], rax
	mov rax, 220
	mov qword ptr [rbp + 13280], rax
	mov rax, 221
	mov qword ptr [rbp + 13360], rax
	mov rax, 222
	mov qword ptr [rbp + 13448], rax
	mov rax, 223
	mov qword ptr [rbp + 13536], rax
	mov rax, 224
	mov qword ptr [rbp + 13624], rax
	mov rax, 225
	mov qword ptr [rbp + 13704], rax
	mov rax, 226
	mov qword ptr [rbp + 13776], rax
	mov rax, 227
	mov qword ptr [rbp + 13880], rax
	mov rax, 228
	mov qword ptr [rbp + 13952], rax
	mov rax, 229
	mov qword ptr [rbp + 14048], rax
	mov rax, 230
	mov qword ptr [rbp + 14152], rax
	mov rax, 231
	mov qword ptr [rbp + 14288], rax
	mov rax, 232
	mov qword ptr [rbp + 14352], rax
	mov rax, 233
	mov qword ptr [rbp + 14440], rax
	mov rax, 234
	mov qword ptr [rbp + 14536], rax
	mov rax, 235
	mov qword ptr [rbp + 14608], rax
	mov rax, 236
	mov qword ptr [rbp + 14672], rax
	mov rax, 237
	mov qword ptr [rbp + 14744], rax
	mov rax, 238
	mov qword ptr [rbp + 14824], rax
	mov rax, 239
	mov qword ptr [rbp + 14912], rax
	mov rax, 240
	mov qword ptr [rbp + 14984], rax
	mov rax, 241
	mov qword ptr [rbp + 15040], rax
	mov rax, 242
	mov qword ptr [rbp + 15112], rax
	mov rax, 243
	mov qword ptr [rbp + 15184], rax
	mov rax, 244
	mov qword ptr [rbp + 15232], rax
	mov rax, 245
	mov qword ptr [rbp + 15296], rax
	mov rax, 246
	mov qword ptr [rbp + 15360], rax
	mov rax, 247
	mov qword ptr [rbp + 15432], rax
	mov rax, 248
	mov qword ptr [rbp + 15504], rax
	mov rax, 249
	mov qword ptr [rbp + 15576], rax
	mov rax, 250
	mov qword ptr [rbp + 15632], rax
	mov rax, 251
	mov qword ptr [rbp + 15704], rax
	mov rax, 252
	mov qword ptr [rbp + 15776], rax
	mov rax, 253
	mov qword ptr [rbp + 15848], rax
	mov rax, 254
	mov qword ptr [rbp + 15920], rax
	mov rax, 255
	mov qword ptr [rbp + 15976], rax
	mov rax, 256
	mov qword ptr [rbp + 16048], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2056], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 2016], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1968], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1912], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1856], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1760], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1696], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1592], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1552], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1464], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1392], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1344], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1288], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1208], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1120], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 1048], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 976], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 904], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 832], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 760], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 696], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 624], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 576], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 504], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 440], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 368], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 240], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 96], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 40], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp + 32], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp + 80], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp + 152], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp + 232], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp + 280], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp + 320], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp + 392], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp + 480], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 568], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 632], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 688], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 792], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 856], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 936], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 1040], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 1096], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 1144], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 1376], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 1416], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 1440], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 1616], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 1688], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 1760], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 2008], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 2048], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 2096], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 2160], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 2208], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 2256], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 2328], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 2392], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 2448], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 2504], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 2560], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 2624], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 2680], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 2728], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 2792], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2848], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2904], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 2944], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 3000], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 3056], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 3128], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 3192], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 3240], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 3296], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 3368], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 3432], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 3480], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 3544], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 3616], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 3680], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 3864], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 3928], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 4008], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 4064], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 4136], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 4224], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 4280], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 4352], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 4424], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 4480], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 4552], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 4632], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 4696], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 4760], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 4816], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 4880], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 4936], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 5000], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 5072], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 5144], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 5192], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 5264], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 5336], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 5384], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 5464], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 5552], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 5584], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 5624], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 5680], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 5752], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 5824], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 5896], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 5976], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 6032], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 6104], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 6184], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 6248], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 6328], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 6392], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 6472], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 6528], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 6592], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 6656], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 6720], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 6784], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 6840], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 6904], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 6976], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 7056], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 7120], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 7184], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 7264], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 7336], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 7392], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 7448], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 7528], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 7592], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 7664], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 7728], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 7800], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 7848], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 7928], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 7992], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 8048], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 8104], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 8176], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 8256], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 8304], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 8352], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 8432], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 8512], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 8544], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 8608], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 8680], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 8728], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 8808], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 8888], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 8960], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 9024], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 9088], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 9152], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 9200], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 9280], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 9336], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 9416], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 9480], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 9552], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 9608], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 9680], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 9720], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 9792], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 9864], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 9920], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 9992], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 10048], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 10128], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 10200], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 10264], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 10336], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 10392], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 10464], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 10536], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 10600], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 10680], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 10760], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 10848], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 10928], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 10992], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 11080], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 11160], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 11232], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 11320], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 11384], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 11528], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 11616], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 11696], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 11784], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 11864], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 11936], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 12032], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 12104], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 12192], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 12280], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 12368], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 12440], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 12520], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 12592], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 12672], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 12768], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 12848], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 12944], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 13032], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 13104], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 13200], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 13280], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 13360], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 13448], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 13536], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 13624], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 13704], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 13776], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 13880], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 13952], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 14048], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 14152], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 14288], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 14352], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 14440], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 14536], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 14608], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 14672], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 14744], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 14824], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 14912], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 14984], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 15040], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 15112], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 15184], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 15232], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 15296], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 15360], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 15432], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 15504], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 15576], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 15632], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 15704], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 15776], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 15848], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 15920], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 15976], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 16048], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f8:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2056]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 2008]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1960]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1872]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1816]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1760]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1688]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1608]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1544]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1480]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1408]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1344]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1280]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1192]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1112]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 1048]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 976]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 904]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 832]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 768]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 680]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 616]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 584]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 528]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 416]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 344]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 248]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 184]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 24]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp + 40]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp + 96]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp + 168]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp + 232]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp + 288]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp + 328]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp + 384]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp + 480]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 552]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 632]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 696]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 800]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 856]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 920]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 992]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 1136]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 1368]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 1392]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 1416]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 1448]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 1472]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 1640]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 1696]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 1792]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 1840]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 1880]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 1928]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 1960]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 2040]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 2128]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 2224]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 2288]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 2368]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 2440]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 2536]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 2616]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 2672]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 2744]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2808]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2888]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 2952]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 3024]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 3088]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 3168]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 3248]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 3312]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 3400]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 3488]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 3552]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 3632]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 3720]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 3792]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 3872]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 3952]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 4032]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 4104]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 4128]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 4208]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 4272]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 4360]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 4432]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 4504]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 4584]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 4664]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 4736]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 4832]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 4912]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 4976]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 5056]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 5128]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 5208]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 5352]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 5416]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 5528]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 5632]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 5704]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 5776]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 5856]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 5928]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 6016]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 6096]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 6176]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 6256]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 6336]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 6400]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 6480]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 6560]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 6616]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 6712]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 6776]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 6856]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 6936]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 7016]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 7104]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 7168]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 7248]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 7320]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 7400]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 7480]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 7552]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 7624]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 7704]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 7768]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 7848]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 7936]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 8024]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 8080]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 8152]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 8216]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 8288]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 8368]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 8440]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 8520]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 8600]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 8672]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 8736]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 8824]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 8904]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 8976]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 9064]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 9144]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 9240]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 9312]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 9384]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 9472]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 9560]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 9624]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 9736]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 9824]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 9896]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 9968]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 10040]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 10104]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 10192]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 10280]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 10360]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 10432]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 10520]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 10608]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 10696]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 10800]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 10896]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 11408]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 11568]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 11632]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 11712]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 11800]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 11888]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 11960]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 12024]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 12096]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 12184]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 12264]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 12352]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 12424]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 12512]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 12584]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 12664]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 12712]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 12792]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 12872]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 12952]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 13016]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 13096]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 13184]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 13272]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 13344]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 13424]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 13512]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 13576]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 13656]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 13744]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 13816]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 13896]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 13976]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 14056]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 14160]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 14200]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 14264]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 14336]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 14400]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 14480]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 14552]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 14616]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 14696]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 14752]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 14808]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 14896]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 14968]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 15032]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 15096]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 15152]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 15216]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 15288]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 15344]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 15408]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 15464]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 15528]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 15600]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 15664]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 15728]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 15800]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 15872]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 15944]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 16008]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 16072]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 16128]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 16192]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 16248]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 16304]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 16360]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 16400]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 16464]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 16512]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 16568]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 16608]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 16656]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 16704]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 16736]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 16760]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 16792]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 16832]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 16848]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 16872]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2056], rax
	mov rax, 5
	mov qword ptr [rbp - 2008], rax
	mov rax, 6
	mov qword ptr [rbp - 1960], rax
	mov rax, 7
	mov qword ptr [rbp - 1872], rax
	mov rax, 8
	mov qword ptr [rbp - 1816], rax
	mov rax, 9
	mov qword ptr [rbp - 1760], rax
	mov rax, 10
	mov qword ptr [rbp - 1688], rax
	mov rax, 11
	mov qword ptr [rbp - 1608], rax
	mov rax, 12
	mov qword ptr [rbp - 1544], rax
	mov rax, 13
	mov qword ptr [rbp - 1480], rax
	mov rax, 14
	mov qword ptr [rbp - 1408], rax
	mov rax, 15
	mov qword ptr [rbp - 1344], rax
	mov rax, 16
	mov qword ptr [rbp - 1280], rax
	mov rax, 17
	mov qword ptr [rbp - 1192], rax
	mov rax, 18
	mov qword ptr [rbp - 1112], rax
	mov rax, 19
	mov qword ptr [rbp - 1048], rax
	mov rax, 20
	mov qword ptr [rbp - 976], rax
	mov rax, 21
	mov qword ptr [rbp - 904], rax
	mov rax, 22
	mov qword ptr [rbp - 832], rax
	mov rax, 23
	mov qword ptr [rbp - 768], rax
	mov rax, 24
	mov qword ptr [rbp - 680], rax
	mov rax, 25
	mov qword ptr [rbp - 616], rax
	mov rax, 26
	mov qword ptr [rbp - 584], rax
	mov rax, 27
	mov qword ptr [rbp - 528], rax
	mov rax, 28
	mov qword ptr [rbp - 416], rax
	mov rax, 29
	mov qword ptr [rbp - 344], rax
	mov rax, 30
	mov qword ptr [rbp - 248], rax
	mov rax, 31
	mov qword ptr [rbp - 184], rax
	mov rax, 32
	mov qword ptr [rbp - 24], rax
	mov rax, 33
	mov qword ptr [rbp + 40], rax
	mov rax, 34
	mov qword ptr [rbp + 96], rax
	mov rax, 35
	mov qword ptr [rbp + 168], rax
	mov rax, 36
	mov qword ptr [rbp + 232], rax
	mov rax, 37
	mov qword ptr [rbp + 288], rax
	mov rax, 38
	mov qword ptr [rbp + 328], rax
	mov rax, 39
	mov qword ptr [rbp + 384], rax
	mov rax, 40
	mov qword ptr [rbp + 480], rax
	mov rax, 41
	mov qword ptr [rbp + 552], rax
	mov rax, 42
	mov qword ptr [rbp + 632], rax
	mov rax, 43
	mov qword ptr [rbp + 696], rax
	mov rax, 44
	mov qword ptr [rbp + 800], rax
	mov rax, 45
	mov qword ptr [rbp + 856], rax
	mov rax, 46
	mov qword ptr [rbp + 920], rax
	mov rax, 47
	mov qword ptr [rbp + 992], rax
	mov rax, 48
	mov qword ptr [rbp + 1136], rax
	mov rax, 49
	mov qword ptr [rbp + 1368], rax
	mov rax, 50
	mov qword ptr [rbp + 1392], rax
	mov rax, 51
	mov qword ptr [rbp + 1416], rax
	mov rax, 52
	mov qword ptr [rbp + 1448], rax
	mov rax, 53
	mov qword ptr [rbp + 1472], rax
	mov rax, 54
	mov qword ptr [rbp + 1640], rax
	mov rax, 55
	mov qword ptr [rbp + 1696], rax
	mov rax, 56
	mov qword ptr [rbp + 1792], rax
	mov rax, 57
	mov qword ptr [rbp + 1840], rax
	mov rax, 58
	mov qword ptr [rbp + 1880], rax
	mov rax, 59
	mov qword ptr [rbp + 1928], rax
	mov rax, 60
	mov qword ptr [rbp + 1960], rax
	mov rax, 61
	mov qword ptr [rbp + 2040], rax
	mov rax, 62
	mov qword ptr [rbp + 2128], rax
	mov rax, 63
	mov qword ptr [rbp + 2224], rax
	mov rax, 64
	mov qword ptr [rbp + 2288], rax
	mov rax, 65
	mov qword ptr [rbp + 2368], rax
	mov rax, 66
	mov qword ptr [rbp + 2440], rax
	mov rax, 67
	mov qword ptr [rbp + 2536], rax
	mov rax, 68
	mov qword ptr [rbp + 2616], rax
	mov rax, 69
	mov qword ptr [rbp + 2672], rax
	mov rax, 70
	mov qword ptr [rbp + 2744], rax
	mov rax, 71
	mov qword ptr [rbp + 2808], rax
	mov rax, 72
	mov qword ptr [rbp + 2888], rax
	mov rax, 73
	mov qword ptr [rbp + 2952], rax
	mov rax, 74
	mov qword ptr [rbp + 3024], rax
	mov rax, 75
	mov qword ptr [rbp + 3088], rax
	mov rax, 76
	mov qword ptr [rbp + 3168], rax
	mov rax, 77
	mov qword ptr [rbp + 3248], rax
	mov rax, 78
	mov qword ptr [rbp + 3312], rax
	mov rax, 79
	mov qword ptr [rbp + 3400], rax
	mov rax, 80
	mov qword ptr [rbp + 3488], rax
	mov rax, 81
	mov qword ptr [rbp + 3552], rax
	mov rax, 82
	mov qword ptr [rbp + 3632], rax
	mov rax, 83
	mov qword ptr [rbp + 3720], rax
	mov rax, 84
	mov qword ptr [rbp + 3792], rax
	mov rax, 85
	mov qword ptr [rbp + 3872], rax
	mov rax, 86
	mov qword ptr [rbp + 3952], rax
	mov rax, 87
	mov qword ptr [rbp + 4032], rax
	mov rax, 88
	mov qword ptr [rbp + 4104], rax
	mov rax, 89
	mov qword ptr [rbp + 4128], rax
	mov rax, 90
	mov qword ptr [rbp + 4208], rax
	mov rax, 91
	mov qword ptr [rbp + 4272], rax
	mov rax, 92
	mov qword ptr [rbp + 4360], rax
	mov rax, 93
	mov qword ptr [rbp + 4432], rax
	mov rax, 94
	mov qword ptr [rbp + 4504], rax
	mov rax, 95
	mov qword ptr [rbp + 4584], rax
	mov rax, 96
	mov qword ptr [rbp + 4664], rax
	mov rax, 97
	mov qword ptr [rbp + 4736], rax
	mov rax, 98
	mov qword ptr [rbp + 4832], rax
	mov rax, 99
	mov qword ptr [rbp + 4912], rax
	mov rax, 100
	mov qword ptr [rbp + 4976], rax
	mov rax, 101
	mov qword ptr [rbp + 5056], rax
	mov rax, 102
	mov qword ptr [rbp + 5128], rax
	mov rax, 103
	mov qword ptr [rbp + 5208], rax
	mov rax, 104
	mov qword ptr [rbp + 5352], rax
	mov rax, 105
	mov qword ptr [rbp + 5416], rax
	mov rax, 106
	mov qword ptr [rbp + 5528], rax
	mov rax, 107
	mov qword ptr [rbp + 5632], rax
	mov rax, 108
	mov qword ptr [rbp + 5704], rax
	mov rax, 109
	mov qword ptr [rbp + 5776], rax
	mov rax, 110
	mov qword ptr [rbp + 5856], rax
	mov rax, 111
	mov qword ptr [rbp + 5928], rax
	mov rax, 112
	mov qword ptr [rbp + 6016], rax
	mov rax, 113
	mov qword ptr [rbp + 6096], rax
	mov rax, 114
	mov qword ptr [rbp + 6176], rax
	mov rax, 115
	mov qword ptr [rbp + 6256], rax
	mov rax, 116
	mov qword ptr [rbp + 6336], rax
	mov rax, 117
	mov qword ptr [rbp + 6400], rax
	mov rax, 118
	mov qword ptr [rbp + 6480], rax
	mov rax, 119
	mov qword ptr [rbp + 6560], rax
	mov rax, 120
	mov qword ptr [rbp + 6616], rax
	mov rax, 121
	mov qword ptr [rbp + 6712], rax
	mov rax, 122
	mov qword ptr [rbp + 6776], rax
	mov rax, 123
	mov qword ptr [rbp + 6856], rax
	mov rax, 124
	mov qword ptr [rbp + 6936], rax
	mov rax, 125
	mov qword ptr [rbp + 7016], rax
	mov rax, 126
	mov qword ptr [rbp + 7104], rax
	mov rax, 127
	mov qword ptr [rbp + 7168], rax
	mov rax, 128
	mov qword ptr [rbp + 7248], rax
	mov rax, 129
	mov qword ptr [rbp + 7320], rax
	mov rax, 130
	mov qword ptr [rbp + 7400], rax
	mov rax, 131
	mov qword ptr [rbp + 7480], rax
	mov rax, 132
	mov qword ptr [rbp + 7552], rax
	mov rax, 133
	mov qword ptr [rbp + 7624], rax
	mov rax, 134
	mov qword ptr [rbp + 7704], rax
	mov rax, 135
	mov qword ptr [rbp + 7768], rax
	mov rax, 136
	mov qword ptr [rbp + 7848], rax
	mov rax, 137
	mov qword ptr [rbp + 7936], rax
	mov rax, 138
	mov qword ptr [rbp + 8024], rax
	mov rax, 139
	mov qword ptr [rbp + 8080], rax
	mov rax, 140
	mov qword ptr [rbp + 8152], rax
	mov rax, 141
	mov qword ptr [rbp + 8216], rax
	mov rax, 142
	mov qword ptr [rbp + 8288], rax
	mov rax, 143
	mov qword ptr [rbp + 8368], rax
	mov rax, 144
	mov qword ptr [rbp + 8440], rax
	mov rax, 145
	mov qword ptr [rbp + 8520], rax
	mov rax, 146
	mov qword ptr [rbp + 8600], rax
	mov rax, 147
	mov qword ptr [rbp + 8672], rax
	mov rax, 148
	mov qword ptr [rbp + 8736], rax
	mov rax, 149
	mov qword ptr [rbp + 8824], rax
	mov rax, 150
	mov qword ptr [rbp + 8904], rax
	mov rax, 151
	mov qword ptr [rbp + 8976], rax
	mov rax, 152
	mov qword ptr [rbp + 9064], rax
	mov rax, 153
	mov qword ptr [rbp + 9144], rax
	mov rax, 154
	mov qword ptr [rbp + 9240], rax
	mov rax, 155
	mov qword ptr [rbp + 9312], rax
	mov rax, 156
	mov qword ptr [rbp + 9384], rax
	mov rax, 157
	mov qword ptr [rbp + 9472], rax
	mov rax, 158
	mov qword ptr [rbp + 9560], rax
	mov rax, 159
	mov qword ptr [rbp + 9624], rax
	mov rax, 160
	mov qword ptr [rbp + 9736], rax
	mov rax, 161
	mov qword ptr [rbp + 9824], rax
	mov rax, 162
	mov qword ptr [rbp + 9896], rax
	mov rax, 163
	mov qword ptr [rbp + 9968], rax
	mov rax, 164
	mov qword ptr [rbp + 10040], rax
	mov rax, 165
	mov qword ptr [rbp + 10104], rax
	mov rax, 166
	mov qword ptr [rbp + 10192], rax
	mov rax, 167
	mov qword ptr [rbp + 10280], rax
	mov rax, 168
	mov qword ptr [rbp + 10360], rax
	mov rax, 169
	mov qword ptr [rbp + 10432], rax
	mov rax, 170
	mov qword ptr [rbp + 10520], rax
	mov rax, 171
	mov qword ptr [rbp + 10608], rax
	mov rax, 172
	mov qword ptr [rbp + 10696], rax
	mov rax, 173
	mov qword ptr [rbp + 10800], rax
	mov rax, 174
	mov qword ptr [rbp + 10896], rax
	mov rax, 175
	mov qword ptr [rbp + 11408], rax
	mov rax, 176
	mov qword ptr [rbp + 11568], rax
	mov rax, 177
	mov qword ptr [rbp + 11632], rax
	mov rax, 178
	mov qword ptr [rbp + 11712], rax
	mov rax, 179
	mov qword ptr [rbp + 11800], rax
	mov rax, 180
	mov qword ptr [rbp + 11888], rax
	mov rax, 181
	mov qword ptr [rbp + 11960], rax
	mov rax, 182
	mov qword ptr [rbp + 12024], rax
	mov rax, 183
	mov qword ptr [rbp + 12096], rax
	mov rax, 184
	mov qword ptr [rbp + 12184], rax
	mov rax, 185
	mov qword ptr [rbp + 12264], rax
	mov rax, 186
	mov qword ptr [rbp + 12352], rax
	mov rax, 187
	mov qword ptr [rbp + 12424], rax
	mov rax, 188
	mov qword ptr [rbp + 12512], rax
	mov rax, 189
	mov qword ptr [rbp + 12584], rax
	mov rax, 190
	mov qword ptr [rbp + 12664], rax
	mov rax, 191
	mov qword ptr [rbp + 12712], rax
	mov rax, 192
	mov qword ptr [rbp + 12792], rax
	mov rax, 193
	mov qword ptr [rbp + 12872], rax
	mov rax, 194
	mov qword ptr [rbp + 12952], rax
	mov rax, 195
	mov qword ptr [rbp + 13016], rax
	mov rax, 196
	mov qword ptr [rbp + 13096], rax
	mov rax, 197
	mov qword ptr [rbp + 13184], rax
	mov rax, 198
	mov qword ptr [rbp + 13272], rax
	mov rax, 199
	mov qword ptr [rbp + 13344], rax
	mov rax, 200
	mov qword ptr [rbp + 13424], rax
	mov rax, 201
	mov qword ptr [rbp + 13512], rax
	mov rax, 202
	mov qword ptr [rbp + 13576], rax
	mov rax, 203
	mov qword ptr [rbp + 13656], rax
	mov rax, 204
	mov qword ptr [rbp + 13744], rax
	mov rax, 205
	mov qword ptr [rbp + 13816], rax
	mov rax, 206
	mov qword ptr [rbp + 13896], rax
	mov rax, 207
	mov qword ptr [rbp + 13976], rax
	mov rax, 208
	mov qword ptr [rbp + 14056], rax
	mov rax, 209
	mov qword ptr [rbp + 14160], rax
	mov rax, 210
	mov qword ptr [rbp + 14200], rax
	mov rax, 211
	mov qword ptr [rbp + 14264], rax
	mov rax, 212
	mov qword ptr [rbp + 14336], rax
	mov rax, 213
	mov qword ptr [rbp + 14400], rax
	mov rax, 214
	mov qword ptr [rbp + 14480], rax
	mov rax, 215
	mov qword ptr [rbp + 14552], rax
	mov rax, 216
	mov qword ptr [rbp + 14616], rax
	mov rax, 217
	mov qword ptr [rbp + 14696], rax
	mov rax, 218
	mov qword ptr [rbp + 14752], rax
	mov rax, 219
	mov qword ptr [rbp + 14808], rax
	mov rax, 220
	mov qword ptr [rbp + 14896], rax
	mov rax, 221
	mov qword ptr [rbp + 14968], rax
	mov rax, 222
	mov qword ptr [rbp + 15032], rax
	mov rax, 223
	mov qword ptr [rbp + 15096], rax
	mov rax, 224
	mov qword ptr [rbp + 15152], rax
	mov rax, 225
	mov qword ptr [rbp + 15216], rax
	mov rax, 226
	mov qword ptr [rbp + 15288], rax
	mov rax, 227
	mov qword ptr [rbp + 15344], rax
	mov rax, 228
	mov qword ptr [rbp + 15408], rax
	mov rax, 229
	mov qword ptr [rbp + 15464], rax
	mov rax, 230
	mov qword ptr [rbp + 15528], rax
	mov rax, 231
	mov qword ptr [rbp + 15600], rax
	mov rax, 232
	mov qword ptr [rbp + 15664], rax
	mov rax, 233
	mov qword ptr [rbp + 15728], rax
	mov rax, 234
	mov qword ptr [rbp + 15800], rax
	mov rax, 235
	mov qword ptr [rbp + 15872], rax
	mov rax, 236
	mov qword ptr [rbp + 15944], rax
	mov rax, 237
	mov qword ptr [rbp + 16008], rax
	mov rax, 238
	mov qword ptr [rbp + 16072], rax
	mov rax, 239
	mov qword ptr [rbp + 16128], rax
	mov rax, 240
	mov qword ptr [rbp + 16192], rax
	mov rax, 241
	mov qword ptr [rbp + 16248], rax
	mov rax, 242
	mov qword ptr [rbp + 16304], rax
	mov rax, 243
	mov qword ptr [rbp + 16360], rax
	mov rax, 244
	mov qword ptr [rbp + 16400], rax
	mov rax, 245
	mov qword ptr [rbp + 16464], rax
	mov rax, 246
	mov qword ptr [rbp + 16512], rax
	mov rax, 247
	mov qword ptr [rbp + 16568], rax
	mov rax, 248
	mov qword ptr [rbp + 16608], rax
	mov rax, 249
	mov qword ptr [rbp + 16656], rax
	mov rax, 250
	mov qword ptr [rbp + 16704], rax
	mov rax, 251
	mov qword ptr [rbp + 16736], rax
	mov rax, 252
	mov qword ptr [rbp + 16760], rax
	mov rax, 253
	mov qword ptr [rbp + 16792], rax
	mov rax, 254
	mov qword ptr [rbp + 16832], rax
	mov rax, 255
	mov qword ptr [rbp + 16848], rax
	mov rax, 256
	mov qword ptr [rbp + 16872], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2056], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 2008], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1960], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1872], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1816], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1760], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1688], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1608], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1544], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1480], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1408], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1344], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1280], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1192], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1112], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 1048], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 976], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 904], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 832], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 768], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 680], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 616], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 584], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 528], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 416], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 344], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 248], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 184], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 24], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp + 40], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp + 96], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp + 168], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp + 232], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp + 288], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp + 328], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp + 384], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp + 480], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 552], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 632], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 696], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 800], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 856], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 920], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 992], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 1136], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 1368], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 1392], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 1416], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 1448], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 1472], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 1640], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 1696], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 1792], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 1840], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 1880], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 1928], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 1960], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 2040], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 2128], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 2224], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 2288], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 2368], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 2440], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 2536], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 2616], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 2672], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 2744], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2808], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2888], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 2952], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 3024], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 3088], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 3168], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 3248], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 3312], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 3400], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 3488], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 3552], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 3632], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 3720], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 3792], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 3872], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 3952], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 4032], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 4104], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 4128], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 4208], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 4272], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 4360], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 4432], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 4504], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 4584], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 4664], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 4736], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 4832], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 4912], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 4976], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 5056], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 5128], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 5208], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 5352], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 5416], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 5528], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 5632], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 5704], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 5776], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 5856], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 5928], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 6016], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 6096], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 6176], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 6256], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 6336], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 6400], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 6480], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 6560], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 6616], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 6712], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 6776], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 6856], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 6936], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 7016], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 7104], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 7168], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 7248], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 7320], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 7400], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 7480], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 7552], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 7624], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 7704], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 7768], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 7848], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 7936], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 8024], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 8080], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 8152], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 8216], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 8288], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 8368], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 8440], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 8520], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 8600], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 8672], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 8736], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 8824], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 8904], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 8976], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 9064], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 9144], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 9240], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 9312], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 9384], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 9472], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 9560], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 9624], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 9736], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 9824], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 9896], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 9968], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 10040], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 10104], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 10192], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 10280], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 10360], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 10432], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 10520], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 10608], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 10696], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 10800], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 10896], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 11408], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 11568], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 11632], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 11712], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 11800], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 11888], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 11960], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 12024], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 12096], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 12184], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 12264], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 12352], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 12424], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 12512], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 12584], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 12664], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 12712], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 12792], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 12872], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 12952], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 13016], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 13096], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 13184], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 13272], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 13344], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 13424], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 13512], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 13576], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 13656], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 13744], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 13816], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 13896], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 13976], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 14056], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 14160], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 14200], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 14264], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 14336], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 14400], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 14480], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 14552], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 14616], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 14696], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 14752], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 14808], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 14896], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 14968], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 15032], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 15096], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 15152], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 15216], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 15288], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 15344], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 15408], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 15464], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 15528], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 15600], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 15664], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 15728], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 15800], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 15872], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 15944], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 16008], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 16072], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 16128], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 16192], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 16248], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 16304], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 16360], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 16400], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 16464], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 16512], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 16568], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 16608], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 16656], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 16704], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 16736], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 16760], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 16792], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 16832], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 16848], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 16872], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f5:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2032]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 2000]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1944]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1888]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1824]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1768]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1728]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1656]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1584]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1528]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1448]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1376]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1320]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1232]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1176]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 1088]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 1032]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 960]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 912]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 840]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 792]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 720]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 672]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 584]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 528]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 464]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 376]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 304]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 272]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp - 208]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp - 144]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp - 120]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp - 56]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp - 0]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp + 64]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp + 128]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp + 192]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 272]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 368]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 440]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 496]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 560]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 616]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 712]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 768]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 824]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 888]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 960]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 1032]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 1088]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 1152]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 1184]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 1240]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 1272]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 1288]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 1304]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 1328]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 1336]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 1344]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 1352]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 1360]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 1528]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 1568]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 1648]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 1720]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 1800]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 1984]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2072]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2128]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 2200]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 2280]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 2360]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 2456]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 2536]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 2616]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 2672]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 2752]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 2832]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 2888]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 2952]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 3016]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 3096]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 3168]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 3248]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 3352]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 3416]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 3472]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 3568]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 3632]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 3712]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 3784]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 3872]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 3952]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 4032]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 4112]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 4184]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 4248]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 4328]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 4400]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 4480]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 4568]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 4656]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 4736]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 4840]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 4912]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 4992]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 5064]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 5136]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 5224]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 5328]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 5432]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 5512]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 5656]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 5720]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 5800]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 5888]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 5968]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 6048]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 6120]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 6208]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 6304]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 6384]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 6456]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 6552]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 6640]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 6712]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 6768]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 6872]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 6952]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 7024]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 7104]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 7184]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 7256]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 7344]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 7424]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 7488]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 7560]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 7640]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 7704]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 7792]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 7864]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 7936]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 8016]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 8080]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 8160]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 8224]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 8328]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 8400]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 8480]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 8552]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 8632]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 8704]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 8792]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 8872]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 8928]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 9000]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 9080]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 9152]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 9224]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 9312]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 9400]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 9464]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 9544]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 9640]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 9704]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 9784]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 9856]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 9928]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 10000]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 10088]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 10168]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 10248]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 10328]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 10456]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 10528]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 10616]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 10712]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 10816]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 10920]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 10984]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 11056]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 11112]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 11168]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 11224]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 11272]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 11336]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 11376]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 11504]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 11584]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 11680]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 11760]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 11840]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 11912]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 11976]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 12064]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 12144]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 12208]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 12304]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 12384]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 12472]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 12536]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 12632]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 12720]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 12824]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 12928]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 13024]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 13128]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 13216]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 13312]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 13408]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 13496]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 13584]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 13664]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 13760]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 13840]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 13928]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 14016]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 14104]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 14256]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 14344]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 14424]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 14528]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 14624]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 14720]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 14800]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 14872]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 14920]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 14992]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 15072]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 15136]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 15200]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 15264]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 15328]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 15400]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 15472]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 15544]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 15624]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 15712]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 15792]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 15856]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 15928]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 16000]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 16080]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 16152]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 16216]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 16264]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 16344]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 16416]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 16456]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 16488]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 16520]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 16544]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 16592]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2032], rax
	mov rax, 5
	mov qword ptr [rbp - 2000], rax
	mov rax, 6
	mov qword ptr [rbp - 1944], rax
	mov rax, 7
	mov qword ptr [rbp - 1888], rax
	mov rax, 8
	mov qword ptr [rbp - 1824], rax
	mov rax, 9
	mov qword ptr [rbp - 1768], rax
	mov rax, 10
	mov qword ptr [rbp - 1728], rax
	mov rax, 11
	mov qword ptr [rbp - 1656], rax
	mov rax, 12
	mov qword ptr [rbp - 1584], rax
	mov rax, 13
	mov qword ptr [rbp - 1528], rax
	mov rax, 14
	mov qword ptr [rbp - 1448], rax
	mov rax, 15
	mov qword ptr [rbp - 1376], rax
	mov rax, 16
	mov qword ptr [rbp - 1320], rax
	mov rax, 17
	mov qword ptr [rbp - 1232], rax
	mov rax, 18
	mov qword ptr [rbp - 1176], rax
	mov rax, 19
	mov qword ptr [rbp - 1088], rax
	mov rax, 20
	mov qword ptr [rbp - 1032], rax
	mov rax, 21
	mov qword ptr [rbp - 960], rax
	mov rax, 22
	mov qword ptr [rbp - 912], rax
	mov rax, 23
	mov qword ptr [rbp - 840], rax
	mov rax, 24
	mov qword ptr [rbp - 792], rax
	mov rax, 25
	mov qword ptr [rbp - 720], rax
	mov rax, 26
	mov qword ptr [rbp - 672], rax
	mov rax, 27
	mov qword ptr [rbp - 584], rax
	mov rax, 28
	mov qword ptr [rbp - 528], rax
	mov rax, 29
	mov qword ptr [rbp - 464], rax
	mov rax, 30
	mov qword ptr [rbp - 376], rax
	mov rax, 31
	mov qword ptr [rbp - 304], rax
	mov rax, 32
	mov qword ptr [rbp - 272], rax
	mov rax, 33
	mov qword ptr [rbp - 208], rax
	mov rax, 34
	mov qword ptr [rbp - 144], rax
	mov rax, 35
	mov qword ptr [rbp - 120], rax
	mov rax, 36
	mov qword ptr [rbp - 56], rax
	mov rax, 37
	mov qword ptr [rbp - 0], rax
	mov rax, 38
	mov qword ptr [rbp + 64], rax
	mov rax, 39
	mov qword ptr [rbp + 128], rax
	mov rax, 40
	mov qword ptr [rbp + 192], rax
	mov rax, 41
	mov qword ptr [rbp + 272], rax
	mov rax, 42
	mov qword ptr [rbp + 368], rax
	mov rax, 43
	mov qword ptr [rbp + 440], rax
	mov rax, 44
	mov qword ptr [rbp + 496], rax
	mov rax, 45
	mov qword ptr [rbp + 560], rax
	mov rax, 46
	mov qword ptr [rbp + 616], rax
	mov rax, 47
	mov qword ptr [rbp + 712], rax
	mov rax, 48
	mov qword ptr [rbp + 768], rax
	mov rax, 49
	mov qword ptr [rbp + 824], rax
	mov rax, 50
	mov qword ptr [rbp + 888], rax
	mov rax, 51
	mov qword ptr [rbp + 960], rax
	mov rax, 52
	mov qword ptr [rbp + 1032], rax
	mov rax, 53
	mov qword ptr [rbp + 1088], rax
	mov rax, 54
	mov qword ptr [rbp + 1152], rax
	mov rax, 55
	mov qword ptr [rbp + 1184], rax
	mov rax, 56
	mov qword ptr [rbp + 1240], rax
	mov rax, 57
	mov qword ptr [rbp + 1272], rax
	mov rax, 58
	mov qword ptr [rbp + 1288], rax
	mov rax, 59
	mov qword ptr [rbp + 1304], rax
	mov rax, 60
	mov qword ptr [rbp + 1328], rax
	mov rax, 61
	mov qword ptr [rbp + 1336], rax
	mov rax, 62
	mov qword ptr [rbp + 1344], rax
	mov rax, 63
	mov qword ptr [rbp + 1352], rax
	mov rax, 64
	mov qword ptr [rbp + 1360], rax
	mov rax, 65
	mov qword ptr [rbp + 1528], rax
	mov rax, 66
	mov qword ptr [rbp + 1568], rax
	mov rax, 67
	mov qword ptr [rbp + 1648], rax
	mov rax, 68
	mov qword ptr [rbp + 1720], rax
	mov rax, 69
	mov qword ptr [rbp + 1800], rax
	mov rax, 70
	mov qword ptr [rbp + 1984], rax
	mov rax, 71
	mov qword ptr [rbp + 2072], rax
	mov rax, 72
	mov qword ptr [rbp + 2128], rax
	mov rax, 73
	mov qword ptr [rbp + 2200], rax
	mov rax, 74
	mov qword ptr [rbp + 2280], rax
	mov rax, 75
	mov qword ptr [rbp + 2360], rax
	mov rax, 76
	mov qword ptr [rbp + 2456], rax
	mov rax, 77
	mov qword ptr [rbp + 2536], rax
	mov rax, 78
	mov qword ptr [rbp + 2616], rax
	mov rax, 79
	mov qword ptr [rbp + 2672], rax
	mov rax, 80
	mov qword ptr [rbp + 2752], rax
	mov rax, 81
	mov qword ptr [rbp + 2832], rax
	mov rax, 82
	mov qword ptr [rbp + 2888], rax
	mov rax, 83
	mov qword ptr [rbp + 2952], rax
	mov rax, 84
	mov qword ptr [rbp + 3016], rax
	mov rax, 85
	mov qword ptr [rbp + 3096], rax
	mov rax, 86
	mov qword ptr [rbp + 3168], rax
	mov rax, 87
	mov qword ptr [rbp + 3248], rax
	mov rax, 88
	mov qword ptr [rbp + 3352], rax
	mov rax, 89
	mov qword ptr [rbp + 3416], rax
	mov rax, 90
	mov qword ptr [rbp + 3472], rax
	mov rax, 91
	mov qword ptr [rbp + 3568], rax
	mov rax, 92
	mov qword ptr [rbp + 3632], rax
	mov rax, 93
	mov qword ptr [rbp + 3712], rax
	mov rax, 94
	mov qword ptr [rbp + 3784], rax
	mov rax, 95
	mov qword ptr [rbp + 3872], rax
	mov rax, 96
	mov qword ptr [rbp + 3952], rax
	mov rax, 97
	mov qword ptr [rbp + 4032], rax
	mov rax, 98
	mov qword ptr [rbp + 4112], rax
	mov rax, 99
	mov qword ptr [rbp + 4184], rax
	mov rax, 100
	mov qword ptr [rbp + 4248], rax
	mov rax, 101
	mov qword ptr [rbp + 4328], rax
	mov rax, 102
	mov qword ptr [rbp + 4400], rax
	mov rax, 103
	mov qword ptr [rbp + 4480], rax
	mov rax, 104
	mov qword ptr [rbp + 4568], rax
	mov rax, 105
	mov qword ptr [rbp + 4656], rax
	mov rax, 106
	mov qword ptr [rbp + 4736], rax
	mov rax, 107
	mov qword ptr [rbp + 4840], rax
	mov rax, 108
	mov qword ptr [rbp + 4912], rax
	mov rax, 109
	mov qword ptr [rbp + 4992], rax
	mov rax, 110
	mov qword ptr [rbp + 5064], rax
	mov rax, 111
	mov qword ptr [rbp + 5136], rax
	mov rax, 112
	mov qword ptr [rbp + 5224], rax
	mov rax, 113
	mov qword ptr [rbp + 5328], rax
	mov rax, 114
	mov qword ptr [rbp + 5432], rax
	mov rax, 115
	mov qword ptr [rbp + 5512], rax
	mov rax, 116
	mov qword ptr [rbp + 5656], rax
	mov rax, 117
	mov qword ptr [rbp + 5720], rax
	mov rax, 118
	mov qword ptr [rbp + 5800], rax
	mov rax, 119
	mov qword ptr [rbp + 5888], rax
	mov rax, 120
	mov qword ptr [rbp + 5968], rax
	mov rax, 121
	mov qword ptr [rbp + 6048], rax
	mov rax, 122
	mov qword ptr [rbp + 6120], rax
	mov rax, 123
	mov qword ptr [rbp + 6208], rax
	mov rax, 124
	mov qword ptr [rbp + 6304], rax
	mov rax, 125
	mov qword ptr [rbp + 6384], rax
	mov rax, 126
	mov qword ptr [rbp + 6456], rax
	mov rax, 127
	mov qword ptr [rbp + 6552], rax
	mov rax, 128
	mov qword ptr [rbp + 6640], rax
	mov rax, 129
	mov qword ptr [rbp + 6712], rax
	mov rax, 130
	mov qword ptr [rbp + 6768], rax
	mov rax, 131
	mov qword ptr [rbp + 6872], rax
	mov rax, 132
	mov qword ptr [rbp + 6952], rax
	mov rax, 133
	mov qword ptr [rbp + 7024], rax
	mov rax, 134
	mov qword ptr [rbp + 7104], rax
	mov rax, 135
	mov qword ptr [rbp + 7184], rax
	mov rax, 136
	mov qword ptr [rbp + 7256], rax
	mov rax, 137
	mov qword ptr [rbp + 7344], rax
	mov rax, 138
	mov qword ptr [rbp + 7424], rax
	mov rax, 139
	mov qword ptr [rbp + 7488], rax
	mov rax, 140
	mov qword ptr [rbp + 7560], rax
	mov rax, 141
	mov qword ptr [rbp + 7640], rax
	mov rax, 142
	mov qword ptr [rbp + 7704], rax
	mov rax, 143
	mov qword ptr [rbp + 7792], rax
	mov rax, 144
	mov qword ptr [rbp + 7864], rax
	mov rax, 145
	mov qword ptr [rbp + 7936], rax
	mov rax, 146
	mov qword ptr [rbp + 8016], rax
	mov rax, 147
	mov qword ptr [rbp + 8080], rax
	mov rax, 148
	mov qword ptr [rbp + 8160], rax
	mov rax, 149
	mov qword ptr [rbp + 8224], rax
	mov rax, 150
	mov qword ptr [rbp + 8328], rax
	mov rax, 151
	mov qword ptr [rbp + 8400], rax
	mov rax, 152
	mov qword ptr [rbp + 8480], rax
	mov rax, 153
	mov qword ptr [rbp + 8552], rax
	mov rax, 154
	mov qword ptr [rbp + 8632], rax
	mov rax, 155
	mov qword ptr [rbp + 8704], rax
	mov rax, 156
	mov qword ptr [rbp + 8792], rax
	mov rax, 157
	mov qword ptr [rbp + 8872], rax
	mov rax, 158
	mov qword ptr [rbp + 8928], rax
	mov rax, 159
	mov qword ptr [rbp + 9000], rax
	mov rax, 160
	mov qword ptr [rbp + 9080], rax
	mov rax, 161
	mov qword ptr [rbp + 9152], rax
	mov rax, 162
	mov qword ptr [rbp + 9224], rax
	mov rax, 163
	mov qword ptr [rbp + 9312], rax
	mov rax, 164
	mov qword ptr [rbp + 9400], rax
	mov rax, 165
	mov qword ptr [rbp + 9464], rax
	mov rax, 166
	mov qword ptr [rbp + 9544], rax
	mov rax, 167
	mov qword ptr [rbp + 9640], rax
	mov rax, 168
	mov qword ptr [rbp + 9704], rax
	mov rax, 169
	mov qword ptr [rbp + 9784], rax
	mov rax, 170
	mov qword ptr [rbp + 9856], rax
	mov rax, 171
	mov qword ptr [rbp + 9928], rax
	mov rax, 172
	mov qword ptr [rbp + 10000], rax
	mov rax, 173
	mov qword ptr [rbp + 10088], rax
	mov rax, 174
	mov qword ptr [rbp + 10168], rax
	mov rax, 175
	mov qword ptr [rbp + 10248], rax
	mov rax, 176
	mov qword ptr [rbp + 10328], rax
	mov rax, 177
	mov qword ptr [rbp + 10456], rax
	mov rax, 178
	mov qword ptr [rbp + 10528], rax
	mov rax, 179
	mov qword ptr [rbp + 10616], rax
	mov rax, 180
	mov qword ptr [rbp + 10712], rax
	mov rax, 181
	mov qword ptr [rbp + 10816], rax
	mov rax, 182
	mov qword ptr [rbp + 10920], rax
	mov rax, 183
	mov qword ptr [rbp + 10984], rax
	mov rax, 184
	mov qword ptr [rbp + 11056], rax
	mov rax, 185
	mov qword ptr [rbp + 11112], rax
	mov rax, 186
	mov qword ptr [rbp + 11168], rax
	mov rax, 187
	mov qword ptr [rbp + 11224], rax
	mov rax, 188
	mov qword ptr [rbp + 11272], rax
	mov rax, 189
	mov qword ptr [rbp + 11336], rax
	mov rax, 190
	mov qword ptr [rbp + 11376], rax
	mov rax, 191
	mov qword ptr [rbp + 11504], rax
	mov rax, 192
	mov qword ptr [rbp + 11584], rax
	mov rax, 193
	mov qword ptr [rbp + 11680], rax
	mov rax, 194
	mov qword ptr [rbp + 11760], rax
	mov rax, 195
	mov qword ptr [rbp + 11840], rax
	mov rax, 196
	mov qword ptr [rbp + 11912], rax
	mov rax, 197
	mov qword ptr [rbp + 11976], rax
	mov rax, 198
	mov qword ptr [rbp + 12064], rax
	mov rax, 199
	mov qword ptr [rbp + 12144], rax
	mov rax, 200
	mov qword ptr [rbp + 12208], rax
	mov rax, 201
	mov qword ptr [rbp + 12304], rax
	mov rax, 202
	mov qword ptr [rbp + 12384], rax
	mov rax, 203
	mov qword ptr [rbp + 12472], rax
	mov rax, 204
	mov qword ptr [rbp + 12536], rax
	mov rax, 205
	mov qword ptr [rbp + 12632], rax
	mov rax, 206
	mov qword ptr [rbp + 12720], rax
	mov rax, 207
	mov qword ptr [rbp + 12824], rax
	mov rax, 208
	mov qword ptr [rbp + 12928], rax
	mov rax, 209
	mov qword ptr [rbp + 13024], rax
	mov rax, 210
	mov qword ptr [rbp + 13128], rax
	mov rax, 211
	mov qword ptr [rbp + 13216], rax
	mov rax, 212
	mov qword ptr [rbp + 13312], rax
	mov rax, 213
	mov qword ptr [rbp + 13408], rax
	mov rax, 214
	mov qword ptr [rbp + 13496], rax
	mov rax, 215
	mov qword ptr [rbp + 13584], rax
	mov rax, 216
	mov qword ptr [rbp + 13664], rax
	mov rax, 217
	mov qword ptr [rbp + 13760], rax
	mov rax, 218
	mov qword ptr [rbp + 13840], rax
	mov rax, 219
	mov qword ptr [rbp + 13928], rax
	mov rax, 220
	mov qword ptr [rbp + 14016], rax
	mov rax, 221
	mov qword ptr [rbp + 14104], rax
	mov rax, 222
	mov qword ptr [rbp + 14256], rax
	mov rax, 223
	mov qword ptr [rbp + 14344], rax
	mov rax, 224
	mov qword ptr [rbp + 14424], rax
	mov rax, 225
	mov qword ptr [rbp + 14528], rax
	mov rax, 226
	mov qword ptr [rbp + 14624], rax
	mov rax, 227
	mov qword ptr [rbp + 14720], rax
	mov rax, 228
	mov qword ptr [rbp + 14800], rax
	mov rax, 229
	mov qword ptr [rbp + 14872], rax
	mov rax, 230
	mov qword ptr [rbp + 14920], rax
	mov rax, 231
	mov qword ptr [rbp + 14992], rax
	mov rax, 232
	mov qword ptr [rbp + 15072], rax
	mov rax, 233
	mov qword ptr [rbp + 15136], rax
	mov rax, 234
	mov qword ptr [rbp + 15200], rax
	mov rax, 235
	mov qword ptr [rbp + 15264], rax
	mov rax, 236
	mov qword ptr [rbp + 15328], rax
	mov rax, 237
	mov qword ptr [rbp + 15400], rax
	mov rax, 238
	mov qword ptr [rbp + 15472], rax
	mov rax, 239
	mov qword ptr [rbp + 15544], rax
	mov rax, 240
	mov qword ptr [rbp + 15624], rax
	mov rax, 241
	mov qword ptr [rbp + 15712], rax
	mov rax, 242
	mov qword ptr [rbp + 15792], rax
	mov rax, 243
	mov qword ptr [rbp + 15856], rax
	mov rax, 244
	mov qword ptr [rbp + 15928], rax
	mov rax, 245
	mov qword ptr [rbp + 16000], rax
	mov rax, 246
	mov qword ptr [rbp + 16080], rax
	mov rax, 247
	mov qword ptr [rbp + 16152], rax
	mov rax, 248
	mov qword ptr [rbp + 16216], rax
	mov rax, 249
	mov qword ptr [rbp + 16264], rax
	mov rax, 250
	mov qword ptr [rbp + 16344], rax
	mov rax, 251
	mov qword ptr [rbp + 16416], rax
	mov rax, 252
	mov qword ptr [rbp + 16456], rax
	mov rax, 253
	mov qword ptr [rbp + 16488], rax
	mov rax, 254
	mov qword ptr [rbp + 16520], rax
	mov rax, 255
	mov qword ptr [rbp + 16544], rax
	mov rax, 256
	mov qword ptr [rbp + 16592], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2032], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 2000], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1944], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1888], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1824], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1768], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1728], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1656], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1584], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1528], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1448], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1376], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1320], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1232], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1176], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 1088], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 1032], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 960], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 912], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 840], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 792], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 720], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 672], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 584], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 528], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 464], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 376], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 304], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 272], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp - 208], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp - 144], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp - 120], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp - 56], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp - 0], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp + 64], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp + 128], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp + 192], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 272], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 368], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 440], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 496], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 560], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 616], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 712], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 768], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 824], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 888], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 960], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 1032], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 1088], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 1152], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 1184], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 1240], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 1272], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 1288], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 1304], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 1328], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 1336], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 1344], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 1352], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 1360], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 1528], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 1568], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 1648], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 1720], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 1800], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 1984], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2072], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2128], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 2200], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 2280], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 2360], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 2456], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 2536], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 2616], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 2672], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 2752], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 2832], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 2888], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 2952], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 3016], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 3096], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 3168], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 3248], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 3352], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 3416], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 3472], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 3568], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 3632], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 3712], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 3784], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 3872], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 3952], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 4032], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 4112], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 4184], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 4248], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 4328], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 4400], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 4480], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 4568], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 4656], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 4736], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 4840], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 4912], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 4992], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 5064], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 5136], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 5224], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 5328], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 5432], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 5512], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 5656], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 5720], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 5800], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 5888], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 5968], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 6048], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 6120], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 6208], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 6304], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 6384], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 6456], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 6552], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 6640], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 6712], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 6768], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 6872], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 6952], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 7024], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 7104], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 7184], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 7256], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 7344], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 7424], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 7488], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 7560], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 7640], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 7704], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 7792], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 7864], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 7936], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 8016], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 8080], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 8160], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 8224], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 8328], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 8400], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 8480], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 8552], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 8632], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 8704], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 8792], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 8872], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 8928], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 9000], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 9080], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 9152], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 9224], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 9312], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 9400], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 9464], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 9544], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 9640], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 9704], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 9784], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 9856], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 9928], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 10000], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 10088], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 10168], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 10248], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 10328], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 10456], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 10528], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 10616], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 10712], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 10816], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 10920], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 10984], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 11056], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 11112], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 11168], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 11224], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 11272], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 11336], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 11376], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 11504], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 11584], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 11680], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 11760], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 11840], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 11912], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 11976], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 12064], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 12144], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 12208], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 12304], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 12384], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 12472], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 12536], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 12632], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 12720], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 12824], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 12928], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 13024], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 13128], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 13216], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 13312], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 13408], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 13496], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 13584], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 13664], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 13760], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 13840], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 13928], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 14016], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 14104], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 14256], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 14344], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 14424], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 14528], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 14624], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 14720], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 14800], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 14872], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 14920], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 14992], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 15072], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 15136], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 15200], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 15264], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 15328], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 15400], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 15472], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 15544], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 15624], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 15712], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 15792], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 15856], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 15928], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 16000], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 16080], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 16152], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 16216], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 16264], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 16344], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 16416], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 16456], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 16488], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 16520], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 16544], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 16592], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f1:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2080]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 1976]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1880]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1808]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1752]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1688]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1632]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1576]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1536]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1472]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1400]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1296]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1224]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1144]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1064]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 1000]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 928]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 872]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 776]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 704]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 656]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 568]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 512]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 456]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 392]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 312]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 280]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 200]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 136]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp - 104]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp + 8]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp + 104]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp + 176]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp + 264]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp + 336]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp + 440]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp + 504]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 584]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 648]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 728]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 776]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 840]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 936]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 1024]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 1080]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 1120]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 1232]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 1424]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 1456]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 1488]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 1504]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 1536]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 1624]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 1736]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 1952]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 2024]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 2104]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 2184]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 2272]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 2344]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 2424]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 2496]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 2576]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 2632]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 2704]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 2776]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 2856]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2928]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2992]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 3080]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 3176]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 3256]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 3336]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 3416]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 3504]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 3576]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 3648]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 3752]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 3840]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 3920]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 3992]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 4056]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 4144]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 4216]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 4288]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 4376]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 4440]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 4520]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 4608]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 4688]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 4768]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 4848]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 4920]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 5024]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 5096]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 5200]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 5280]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 5312]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 5376]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 5456]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 5504]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 5600]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 5672]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 5768]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 5848]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 5944]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 6024]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 6112]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 6192]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 6288]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 6368]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 6448]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 6520]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 6608]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 6680]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 6744]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 6848]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 6944]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 7040]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 7112]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 7200]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 7280]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 7368]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 7512]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 7632]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 7704]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 7784]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 7872]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 7960]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 8112]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 8232]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 8312]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 8392]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 8496]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 8592]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 8680]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 8768]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 8856]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 8944]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 9032]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 9112]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 9192]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 9264]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 9344]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 9440]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 9520]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 9616]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 9688]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 9776]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 9840]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 9912]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 9976]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 10056]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 10144]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 10232]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 10320]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 10408]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 10504]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 10576]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 10632]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 10704]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 10752]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 10808]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 10864]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 10936]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 10976]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 11048]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 11096]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 11152]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 11216]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 11264]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 11328]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 11352]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 11488]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 11560]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 11640]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 11736]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 11808]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 11888]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 11952]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 12040]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 12112]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 12200]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 12272]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 12344]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 12432]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 12496]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 12600]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 12688]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 12760]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 12856]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 12920]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 13000]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 13072]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 13152]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 13232]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 13304]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 13392]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 13472]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 13544]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 13616]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 13696]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 13768]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 13856]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 13936]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 14008]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 14096]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 14168]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 14232]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 14312]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 14392]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 14472]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 14520]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 14592]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 14656]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 14728]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 14784]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 14856]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 14936]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 15000]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 15056]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 15120]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 15192]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 15248]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 15304]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 15368]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 15440]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 15496]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 15568]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 15616]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 15688]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 15760]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 15832]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 15904]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 15984]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 16056]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 16112]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 16176]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 16240]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 16296]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 16352]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 16392]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 16448]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 16504]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 16560]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 16600]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 16648]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 16688]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 16728]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 16768]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 16800]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 16824]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 16856]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2080], rax
	mov rax, 5
	mov qword ptr [rbp - 1976], rax
	mov rax, 6
	mov qword ptr [rbp - 1880], rax
	mov rax, 7
	mov qword ptr [rbp - 1808], rax
	mov rax, 8
	mov qword ptr [rbp - 1752], rax
	mov rax, 9
	mov qword ptr [rbp - 1688], rax
	mov rax, 10
	mov qword ptr [rbp - 1632], rax
	mov rax, 11
	mov qword ptr [rbp - 1576], rax
	mov rax, 12
	mov qword ptr [rbp - 1536], rax
	mov rax, 13
	mov qword ptr [rbp - 1472], rax
	mov rax, 14
	mov qword ptr [rbp - 1400], rax
	mov rax, 15
	mov qword ptr [rbp - 1296], rax
	mov rax, 16
	mov qword ptr [rbp - 1224], rax
	mov rax, 17
	mov qword ptr [rbp - 1144], rax
	mov rax, 18
	mov qword ptr [rbp - 1064], rax
	mov rax, 19
	mov qword ptr [rbp - 1000], rax
	mov rax, 20
	mov qword ptr [rbp - 928], rax
	mov rax, 21
	mov qword ptr [rbp - 872], rax
	mov rax, 22
	mov qword ptr [rbp - 776], rax
	mov rax, 23
	mov qword ptr [rbp - 704], rax
	mov rax, 24
	mov qword ptr [rbp - 656], rax
	mov rax, 25
	mov qword ptr [rbp - 568], rax
	mov rax, 26
	mov qword ptr [rbp - 512], rax
	mov rax, 27
	mov qword ptr [rbp - 456], rax
	mov rax, 28
	mov qword ptr [rbp - 392], rax
	mov rax, 29
	mov qword ptr [rbp - 312], rax
	mov rax, 30
	mov qword ptr [rbp - 280], rax
	mov rax, 31
	mov qword ptr [rbp - 200], rax
	mov rax, 32
	mov qword ptr [rbp - 136], rax
	mov rax, 33
	mov qword ptr [rbp - 104], rax
	mov rax, 34
	mov qword ptr [rbp + 8], rax
	mov rax, 35
	mov qword ptr [rbp + 104], rax
	mov rax, 36
	mov qword ptr [rbp + 176], rax
	mov rax, 37
	mov qword ptr [rbp + 264], rax
	mov rax, 38
	mov qword ptr [rbp + 336], rax
	mov rax, 39
	mov qword ptr [rbp + 440], rax
	mov rax, 40
	mov qword ptr [rbp + 504], rax
	mov rax, 41
	mov qword ptr [rbp + 584], rax
	mov rax, 42
	mov qword ptr [rbp + 648], rax
	mov rax, 43
	mov qword ptr [rbp + 728], rax
	mov rax, 44
	mov qword ptr [rbp + 776], rax
	mov rax, 45
	mov qword ptr [rbp + 840], rax
	mov rax, 46
	mov qword ptr [rbp + 936], rax
	mov rax, 47
	mov qword ptr [rbp + 1024], rax
	mov rax, 48
	mov qword ptr [rbp + 1080], rax
	mov rax, 49
	mov qword ptr [rbp + 1120], rax
	mov rax, 50
	mov qword ptr [rbp + 1232], rax
	mov rax, 51
	mov qword ptr [rbp + 1424], rax
	mov rax, 52
	mov qword ptr [rbp + 1456], rax
	mov rax, 53
	mov qword ptr [rbp + 1488], rax
	mov rax, 54
	mov qword ptr [rbp + 1504], rax
	mov rax, 55
	mov qword ptr [rbp + 1536], rax
	mov rax, 56
	mov qword ptr [rbp + 1624], rax
	mov rax, 57
	mov qword ptr [rbp + 1736], rax
	mov rax, 58
	mov qword ptr [rbp + 1952], rax
	mov rax, 59
	mov qword ptr [rbp + 2024], rax
	mov rax, 60
	mov qword ptr [rbp + 2104], rax
	mov rax, 61
	mov qword ptr [rbp + 2184], rax
	mov rax, 62
	mov qword ptr [rbp + 2272], rax
	mov rax, 63
	mov qword ptr [rbp + 2344], rax
	mov rax, 64
	mov qword ptr [rbp + 2424], rax
	mov rax, 65
	mov qword ptr [rbp + 2496], rax
	mov rax, 66
	mov qword ptr [rbp + 2576], rax
	mov rax, 67
	mov qword ptr [rbp + 2632], rax
	mov rax, 68
	mov qword ptr [rbp + 2704], rax
	mov rax, 69
	mov qword ptr [rbp + 2776], rax
	mov rax, 70
	mov qword ptr [rbp + 2856], rax
	mov rax, 71
	mov qword ptr [rbp + 2928], rax
	mov rax, 72
	mov qword ptr [rbp + 2992], rax
	mov rax, 73
	mov qword ptr [rbp + 3080], rax
	mov rax, 74
	mov qword ptr [rbp + 3176], rax
	mov rax, 75
	mov qword ptr [rbp + 3256], rax
	mov rax, 76
	mov qword ptr [rbp + 3336], rax
	mov rax, 77
	mov qword ptr [rbp + 3416], rax
	mov rax, 78
	mov qword ptr [rbp + 3504], rax
	mov rax, 79
	mov qword ptr [rbp + 3576], rax
	mov rax, 80
	mov qword ptr [rbp + 3648], rax
	mov rax, 81
	mov qword ptr [rbp + 3752], rax
	mov rax, 82
	mov qword ptr [rbp + 3840], rax
	mov rax, 83
	mov qword ptr [rbp + 3920], rax
	mov rax, 84
	mov qword ptr [rbp + 3992], rax
	mov rax, 85
	mov qword ptr [rbp + 4056], rax
	mov rax, 86
	mov qword ptr [rbp + 4144], rax
	mov rax, 87
	mov qword ptr [rbp + 4216], rax
	mov rax, 88
	mov qword ptr [rbp + 4288], rax
	mov rax, 89
	mov qword ptr [rbp + 4376], rax
	mov rax, 90
	mov qword ptr [rbp + 4440], rax
	mov rax, 91
	mov qword ptr [rbp + 4520], rax
	mov rax, 92
	mov qword ptr [rbp + 4608], rax
	mov rax, 93
	mov qword ptr [rbp + 4688], rax
	mov rax, 94
	mov qword ptr [rbp + 4768], rax
	mov rax, 95
	mov qword ptr [rbp + 4848], rax
	mov rax, 96
	mov qword ptr [rbp + 4920], rax
	mov rax, 97
	mov qword ptr [rbp + 5024], rax
	mov rax, 98
	mov qword ptr [rbp + 5096], rax
	mov rax, 99
	mov qword ptr [rbp + 5200], rax
	mov rax, 100
	mov qword ptr [rbp + 5280], rax
	mov rax, 101
	mov qword ptr [rbp + 5312], rax
	mov rax, 102
	mov qword ptr [rbp + 5376], rax
	mov rax, 103
	mov qword ptr [rbp + 5456], rax
	mov rax, 104
	mov qword ptr [rbp + 5504], rax
	mov rax, 105
	mov qword ptr [rbp + 5600], rax
	mov rax, 106
	mov qword ptr [rbp + 5672], rax
	mov rax, 107
	mov qword ptr [rbp + 5768], rax
	mov rax, 108
	mov qword ptr [rbp + 5848], rax
	mov rax, 109
	mov qword ptr [rbp + 5944], rax
	mov rax, 110
	mov qword ptr [rbp + 6024], rax
	mov rax, 111
	mov qword ptr [rbp + 6112], rax
	mov rax, 112
	mov qword ptr [rbp + 6192], rax
	mov rax, 113
	mov qword ptr [rbp + 6288], rax
	mov rax, 114
	mov qword ptr [rbp + 6368], rax
	mov rax, 115
	mov qword ptr [rbp + 6448], rax
	mov rax, 116
	mov qword ptr [rbp + 6520], rax
	mov rax, 117
	mov qword ptr [rbp + 6608], rax
	mov rax, 118
	mov qword ptr [rbp + 6680], rax
	mov rax, 119
	mov qword ptr [rbp + 6744], rax
	mov rax, 120
	mov qword ptr [rbp + 6848], rax
	mov rax, 121
	mov qword ptr [rbp + 6944], rax
	mov rax, 122
	mov qword ptr [rbp + 7040], rax
	mov rax, 123
	mov qword ptr [rbp + 7112], rax
	mov rax, 124
	mov qword ptr [rbp + 7200], rax
	mov rax, 125
	mov qword ptr [rbp + 7280], rax
	mov rax, 126
	mov qword ptr [rbp + 7368], rax
	mov rax, 127
	mov qword ptr [rbp + 7512], rax
	mov rax, 128
	mov qword ptr [rbp + 7632], rax
	mov rax, 129
	mov qword ptr [rbp + 7704], rax
	mov rax, 130
	mov qword ptr [rbp + 7784], rax
	mov rax, 131
	mov qword ptr [rbp + 7872], rax
	mov rax, 132
	mov qword ptr [rbp + 7960], rax
	mov rax, 133
	mov qword ptr [rbp + 8112], rax
	mov rax, 134
	mov qword ptr [rbp + 8232], rax
	mov rax, 135
	mov qword ptr [rbp + 8312], rax
	mov rax, 136
	mov qword ptr [rbp + 8392], rax
	mov rax, 137
	mov qword ptr [rbp + 8496], rax
	mov rax, 138
	mov qword ptr [rbp + 8592], rax
	mov rax, 139
	mov qword ptr [rbp + 8680], rax
	mov rax, 140
	mov qword ptr [rbp + 8768], rax
	mov rax, 141
	mov qword ptr [rbp + 8856], rax
	mov rax, 142
	mov qword ptr [rbp + 8944], rax
	mov rax, 143
	mov qword ptr [rbp + 9032], rax
	mov rax, 144
	mov qword ptr [rbp + 9112], rax
	mov rax, 145
	mov qword ptr [rbp + 9192], rax
	mov rax, 146
	mov qword ptr [rbp + 9264], rax
	mov rax, 147
	mov qword ptr [rbp + 9344], rax
	mov rax, 148
	mov qword ptr [rbp + 9440], rax
	mov rax, 149
	mov qword ptr [rbp + 9520], rax
	mov rax, 150
	mov qword ptr [rbp + 9616], rax
	mov rax, 151
	mov qword ptr [rbp + 9688], rax
	mov rax, 152
	mov qword ptr [rbp + 9776], rax
	mov rax, 153
	mov qword ptr [rbp + 9840], rax
	mov rax, 154
	mov qword ptr [rbp + 9912], rax
	mov rax, 155
	mov qword ptr [rbp + 9976], rax
	mov rax, 156
	mov qword ptr [rbp + 10056], rax
	mov rax, 157
	mov qword ptr [rbp + 10144], rax
	mov rax, 158
	mov qword ptr [rbp + 10232], rax
	mov rax, 159
	mov qword ptr [rbp + 10320], rax
	mov rax, 160
	mov qword ptr [rbp + 10408], rax
	mov rax, 161
	mov qword ptr [rbp + 10504], rax
	mov rax, 162
	mov qword ptr [rbp + 10576], rax
	mov rax, 163
	mov qword ptr [rbp + 10632], rax
	mov rax, 164
	mov qword ptr [rbp + 10704], rax
	mov rax, 165
	mov qword ptr [rbp + 10752], rax
	mov rax, 166
	mov qword ptr [rbp + 10808], rax
	mov rax, 167
	mov qword ptr [rbp + 10864], rax
	mov rax, 168
	mov qword ptr [rbp + 10936], rax
	mov rax, 169
	mov qword ptr [rbp + 10976], rax
	mov rax, 170
	mov qword ptr [rbp + 11048], rax
	mov rax, 171
	mov qword ptr [rbp + 11096], rax
	mov rax, 172
	mov qword ptr [rbp + 11152], rax
	mov rax, 173
	mov qword ptr [rbp + 11216], rax
	mov rax, 174
	mov qword ptr [rbp + 11264], rax
	mov rax, 175
	mov qword ptr [rbp + 11328], rax
	mov rax, 176
	mov qword ptr [rbp + 11352], rax
	mov rax, 177
	mov qword ptr [rbp + 11488], rax
	mov rax, 178
	mov qword ptr [rbp + 11560], rax
	mov rax, 179
	mov qword ptr [rbp + 11640], rax
	mov rax, 180
	mov qword ptr [rbp + 11736], rax
	mov rax, 181
	mov qword ptr [rbp + 11808], rax
	mov rax, 182
	mov qword ptr [rbp + 11888], rax
	mov rax, 183
	mov qword ptr [rbp + 11952], rax
	mov rax, 184
	mov qword ptr [rbp + 12040], rax
	mov rax, 185
	mov qword ptr [rbp + 12112], rax
	mov rax, 186
	mov qword ptr [rbp + 12200], rax
	mov rax, 187
	mov qword ptr [rbp + 12272], rax
	mov rax, 188
	mov qword ptr [rbp + 12344], rax
	mov rax, 189
	mov qword ptr [rbp + 12432], rax
	mov rax, 190
	mov qword ptr [rbp + 12496], rax
	mov rax, 191
	mov qword ptr [rbp + 12600], rax
	mov rax, 192
	mov qword ptr [rbp + 12688], rax
	mov rax, 193
	mov qword ptr [rbp + 12760], rax
	mov rax, 194
	mov qword ptr [rbp + 12856], rax
	mov rax, 195
	mov qword ptr [rbp + 12920], rax
	mov rax, 196
	mov qword ptr [rbp + 13000], rax
	mov rax, 197
	mov qword ptr [rbp + 13072], rax
	mov rax, 198
	mov qword ptr [rbp + 13152], rax
	mov rax, 199
	mov qword ptr [rbp + 13232], rax
	mov rax, 200
	mov qword ptr [rbp + 13304], rax
	mov rax, 201
	mov qword ptr [rbp + 13392], rax
	mov rax, 202
	mov qword ptr [rbp + 13472], rax
	mov rax, 203
	mov qword ptr [rbp + 13544], rax
	mov rax, 204
	mov qword ptr [rbp + 13616], rax
	mov rax, 205
	mov qword ptr [rbp + 13696], rax
	mov rax, 206
	mov qword ptr [rbp + 13768], rax
	mov rax, 207
	mov qword ptr [rbp + 13856], rax
	mov rax, 208
	mov qword ptr [rbp + 13936], rax
	mov rax, 209
	mov qword ptr [rbp + 14008], rax
	mov rax, 210
	mov qword ptr [rbp + 14096], rax
	mov rax, 211
	mov qword ptr [rbp + 14168], rax
	mov rax, 212
	mov qword ptr [rbp + 14232], rax
	mov rax, 213
	mov qword ptr [rbp + 14312], rax
	mov rax, 214
	mov qword ptr [rbp + 14392], rax
	mov rax, 215
	mov qword ptr [rbp + 14472], rax
	mov rax, 216
	mov qword ptr [rbp + 14520], rax
	mov rax, 217
	mov qword ptr [rbp + 14592], rax
	mov rax, 218
	mov qword ptr [rbp + 14656], rax
	mov rax, 219
	mov qword ptr [rbp + 14728], rax
	mov rax, 220
	mov qword ptr [rbp + 14784], rax
	mov rax, 221
	mov qword ptr [rbp + 14856], rax
	mov rax, 222
	mov qword ptr [rbp + 14936], rax
	mov rax, 223
	mov qword ptr [rbp + 15000], rax
	mov rax, 224
	mov qword ptr [rbp + 15056], rax
	mov rax, 225
	mov qword ptr [rbp + 15120], rax
	mov rax, 226
	mov qword ptr [rbp + 15192], rax
	mov rax, 227
	mov qword ptr [rbp + 15248], rax
	mov rax, 228
	mov qword ptr [rbp + 15304], rax
	mov rax, 229
	mov qword ptr [rbp + 15368], rax
	mov rax, 230
	mov qword ptr [rbp + 15440], rax
	mov rax, 231
	mov qword ptr [rbp + 15496], rax
	mov rax, 232
	mov qword ptr [rbp + 15568], rax
	mov rax, 233
	mov qword ptr [rbp + 15616], rax
	mov rax, 234
	mov qword ptr [rbp + 15688], rax
	mov rax, 235
	mov qword ptr [rbp + 15760], rax
	mov rax, 236
	mov qword ptr [rbp + 15832], rax
	mov rax, 237
	mov qword ptr [rbp + 15904], rax
	mov rax, 238
	mov qword ptr [rbp + 15984], rax
	mov rax, 239
	mov qword ptr [rbp + 16056], rax
	mov rax, 240
	mov qword ptr [rbp + 16112], rax
	mov rax, 241
	mov qword ptr [rbp + 16176], rax
	mov rax, 242
	mov qword ptr [rbp + 16240], rax
	mov rax, 243
	mov qword ptr [rbp + 16296], rax
	mov rax, 244
	mov qword ptr [rbp + 16352], rax
	mov rax, 245
	mov qword ptr [rbp + 16392], rax
	mov rax, 246
	mov qword ptr [rbp + 16448], rax
	mov rax, 247
	mov qword ptr [rbp + 16504], rax
	mov rax, 248
	mov qword ptr [rbp + 16560], rax
	mov rax, 249
	mov qword ptr [rbp + 16600], rax
	mov rax, 250
	mov qword ptr [rbp + 16648], rax
	mov rax, 251
	mov qword ptr [rbp + 16688], rax
	mov rax, 252
	mov qword ptr [rbp + 16728], rax
	mov rax, 253
	mov qword ptr [rbp + 16768], rax
	mov rax, 254
	mov qword ptr [rbp + 16800], rax
	mov rax, 255
	mov qword ptr [rbp + 16824], rax
	mov rax, 256
	mov qword ptr [rbp + 16856], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2080], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 1976], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1880], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1808], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1752], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1688], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1632], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1576], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1536], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1472], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1400], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1296], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1224], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1144], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1064], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 1000], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 928], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 872], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 776], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 704], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 656], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 568], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 512], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 456], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 392], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 312], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 280], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 200], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 136], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp - 104], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp + 8], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp + 104], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp + 176], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp + 264], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp + 336], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp + 440], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp + 504], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 584], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 648], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 728], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 776], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 840], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 936], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 1024], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 1080], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 1120], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 1232], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 1424], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 1456], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 1488], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 1504], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 1536], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 1624], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 1736], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 1952], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 2024], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 2104], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 2184], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 2272], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 2344], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 2424], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 2496], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 2576], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 2632], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 2704], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 2776], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 2856], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2928], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2992], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 3080], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 3176], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 3256], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 3336], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 3416], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 3504], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 3576], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 3648], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 3752], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 3840], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 3920], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 3992], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 4056], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 4144], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 4216], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 4288], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 4376], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 4440], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 4520], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 4608], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 4688], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 4768], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 4848], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 4920], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 5024], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 5096], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 5200], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 5280], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 5312], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 5376], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 5456], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 5504], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 5600], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 5672], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 5768], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 5848], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 5944], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 6024], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 6112], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 6192], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 6288], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 6368], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 6448], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 6520], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 6608], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 6680], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 6744], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 6848], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 6944], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 7040], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 7112], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 7200], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 7280], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 7368], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 7512], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 7632], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 7704], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 7784], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 7872], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 7960], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 8112], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 8232], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 8312], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 8392], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 8496], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 8592], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 8680], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 8768], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 8856], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 8944], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 9032], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 9112], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 9192], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 9264], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 9344], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 9440], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 9520], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 9616], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 9688], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 9776], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 9840], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 9912], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 9976], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 10056], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 10144], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 10232], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 10320], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 10408], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 10504], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 10576], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 10632], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 10704], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 10752], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 10808], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 10864], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 10936], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 10976], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 11048], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 11096], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 11152], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 11216], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 11264], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 11328], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 11352], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 11488], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 11560], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 11640], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 11736], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 11808], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 11888], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 11952], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 12040], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 12112], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 12200], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 12272], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 12344], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 12432], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 12496], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 12600], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 12688], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 12760], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 12856], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 12920], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 13000], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 13072], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 13152], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 13232], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 13304], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 13392], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 13472], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 13544], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 13616], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 13696], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 13768], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 13856], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 13936], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 14008], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 14096], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 14168], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 14232], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 14312], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 14392], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 14472], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 14520], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 14592], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 14656], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 14728], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 14784], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 14856], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 14936], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 15000], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 15056], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 15120], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 15192], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 15248], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 15304], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 15368], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 15440], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 15496], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 15568], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 15616], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 15688], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 15760], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 15832], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 15904], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 15984], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 16056], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 16112], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 16176], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 16240], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 16296], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 16352], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 16392], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 16448], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 16504], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 16560], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 16600], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 16648], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 16688], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 16728], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 16768], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 16800], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 16824], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 16856], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f4:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2048]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 1920]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1848]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1784]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1736]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1672]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1616]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1496]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1416]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1352]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1304]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1240]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1160]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1096]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1016]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 944]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 888]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 824]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 648]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 584]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 504]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 448]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 360]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 248]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 168]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 80]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 8]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp + 56]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp + 112]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp + 184]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp + 288]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp + 336]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp + 424]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp + 488]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp + 536]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp + 616]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp + 680]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 752]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 824]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 904]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 976]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 1048]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 1104]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 1160]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 1200]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 1248]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 1464]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 1496]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 1520]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 1552]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 1560]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 1616]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 1680]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 1768]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 1824]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 1888]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 1944]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 2016]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 2080]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 2152]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 2240]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 2312]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 2400]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 2464]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 2520]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 2592]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 2648]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2720]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2800]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 2896]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 2960]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 3032]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 3120]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 3208]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 3304]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 3384]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 3456]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 3536]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 3608]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 3696]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 3768]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 3832]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 3904]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 4000]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 4080]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 4168]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 4256]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 4344]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 4416]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 4512]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 4624]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 4704]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 4776]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 4856]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 4928]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 5008]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 5104]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 5184]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 5264]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 5360]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 5424]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 5480]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 5544]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 5728]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 5832]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 5920]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 5992]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 6072]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 6168]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 6264]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 6344]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 6432]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 6528]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 6600]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 6672]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 6728]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 6808]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 6896]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 6984]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 7072]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 7152]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 7240]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 7328]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 7408]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 7496]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 7584]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 7672]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 7760]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 7832]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 7912]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 7984]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 8072]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 8144]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 8240]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 8336]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 8424]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 8504]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 8584]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 8656]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 8744]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 8832]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 8920]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 9008]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 9104]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 9176]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 9272]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 9352]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 9448]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 9536]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 9632]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 9712]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 10112]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 10184]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 10256]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 10344]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 10408]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 10488]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 10592]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 10664]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 10736]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 10824]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 10872]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 10952]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 11008]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 11072]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 11128]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 11176]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 11248]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 11304]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 11416]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 11448]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 11496]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 11576]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 11664]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 11744]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 11832]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 11904]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 11992]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 12080]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 12168]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 12248]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 12328]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 12400]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 12504]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 12528]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 12608]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 12680]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 12752]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 12832]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 12904]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 12976]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 13048]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 13112]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 13176]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 13240]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 13320]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 13384]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 13432]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 13504]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 13568]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 13648]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 13712]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 13792]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 13848]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 13920]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 14000]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 14072]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 14136]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 14224]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 14296]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 14368]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 14408]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 14488]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 14560]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 14632]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 14688]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 14760]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 14840]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 14880]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 14960]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 15008]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 15064]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 15128]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 15176]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 15224]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 15272]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 15336]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 15376]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 15424]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 15480]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 15536]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 15592]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 15648]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 15672]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 15720]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 15744]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 15784]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 15824]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 15864]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 15896]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 15936]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 15968]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 16024]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 16040]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 16096]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 16120]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 16160]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 16184]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 16224]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 16280]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 16320]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 16376]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 16432]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2048], rax
	mov rax, 5
	mov qword ptr [rbp - 1920], rax
	mov rax, 6
	mov qword ptr [rbp - 1848], rax
	mov rax, 7
	mov qword ptr [rbp - 1784], rax
	mov rax, 8
	mov qword ptr [rbp - 1736], rax
	mov rax, 9
	mov qword ptr [rbp - 1672], rax
	mov rax, 10
	mov qword ptr [rbp - 1616], rax
	mov rax, 11
	mov qword ptr [rbp - 1496], rax
	mov rax, 12
	mov qword ptr [rbp - 1416], rax
	mov rax, 13
	mov qword ptr [rbp - 1352], rax
	mov rax, 14
	mov qword ptr [rbp - 1304], rax
	mov rax, 15
	mov qword ptr [rbp - 1240], rax
	mov rax, 16
	mov qword ptr [rbp - 1160], rax
	mov rax, 17
	mov qword ptr [rbp - 1096], rax
	mov rax, 18
	mov qword ptr [rbp - 1016], rax
	mov rax, 19
	mov qword ptr [rbp - 944], rax
	mov rax, 20
	mov qword ptr [rbp - 888], rax
	mov rax, 21
	mov qword ptr [rbp - 824], rax
	mov rax, 22
	mov qword ptr [rbp - 648], rax
	mov rax, 23
	mov qword ptr [rbp - 584], rax
	mov rax, 24
	mov qword ptr [rbp - 504], rax
	mov rax, 25
	mov qword ptr [rbp - 448], rax
	mov rax, 26
	mov qword ptr [rbp - 360], rax
	mov rax, 27
	mov qword ptr [rbp - 248], rax
	mov rax, 28
	mov qword ptr [rbp - 168], rax
	mov rax, 29
	mov qword ptr [rbp - 80], rax
	mov rax, 30
	mov qword ptr [rbp - 8], rax
	mov rax, 31
	mov qword ptr [rbp + 56], rax
	mov rax, 32
	mov qword ptr [rbp + 112], rax
	mov rax, 33
	mov qword ptr [rbp + 184], rax
	mov rax, 34
	mov qword ptr [rbp + 288], rax
	mov rax, 35
	mov qword ptr [rbp + 336], rax
	mov rax, 36
	mov qword ptr [rbp + 424], rax
	mov rax, 37
	mov qword ptr [rbp + 488], rax
	mov rax, 38
	mov qword ptr [rbp + 536], rax
	mov rax, 39
	mov qword ptr [rbp + 616], rax
	mov rax, 40
	mov qword ptr [rbp + 680], rax
	mov rax, 41
	mov qword ptr [rbp + 752], rax
	mov rax, 42
	mov qword ptr [rbp + 824], rax
	mov rax, 43
	mov qword ptr [rbp + 904], rax
	mov rax, 44
	mov qword ptr [rbp + 976], rax
	mov rax, 45
	mov qword ptr [rbp + 1048], rax
	mov rax, 46
	mov qword ptr [rbp + 1104], rax
	mov rax, 47
	mov qword ptr [rbp + 1160], rax
	mov rax, 48
	mov qword ptr [rbp + 1200], rax
	mov rax, 49
	mov qword ptr [rbp + 1248], rax
	mov rax, 50
	mov qword ptr [rbp + 1464], rax
	mov rax, 51
	mov qword ptr [rbp + 1496], rax
	mov rax, 52
	mov qword ptr [rbp + 1520], rax
	mov rax, 53
	mov qword ptr [rbp + 1552], rax
	mov rax, 54
	mov qword ptr [rbp + 1560], rax
	mov rax, 55
	mov qword ptr [rbp + 1616], rax
	mov rax, 56
	mov qword ptr [rbp + 1680], rax
	mov rax, 57
	mov qword ptr [rbp + 1768], rax
	mov rax, 58
	mov qword ptr [rbp + 1824], rax
	mov rax, 59
	mov qword ptr [rbp + 1888], rax
	mov rax, 60
	mov qword ptr [rbp + 1944], rax
	mov rax, 61
	mov qword ptr [rbp + 2016], rax
	mov rax, 62
	mov qword ptr [rbp + 2080], rax
	mov rax, 63
	mov qword ptr [rbp + 2152], rax
	mov rax, 64
	mov qword ptr [rbp + 2240], rax
	mov rax, 65
	mov qword ptr [rbp + 2312], rax
	mov rax, 66
	mov qword ptr [rbp + 2400], rax
	mov rax, 67
	mov qword ptr [rbp + 2464], rax
	mov rax, 68
	mov qword ptr [rbp + 2520], rax
	mov rax, 69
	mov qword ptr [rbp + 2592], rax
	mov rax, 70
	mov qword ptr [rbp + 2648], rax
	mov rax, 71
	mov qword ptr [rbp + 2720], rax
	mov rax, 72
	mov qword ptr [rbp + 2800], rax
	mov rax, 73
	mov qword ptr [rbp + 2896], rax
	mov rax, 74
	mov qword ptr [rbp + 2960], rax
	mov rax, 75
	mov qword ptr [rbp + 3032], rax
	mov rax, 76
	mov qword ptr [rbp + 3120], rax
	mov rax, 77
	mov qword ptr [rbp + 3208], rax
	mov rax, 78
	mov qword ptr [rbp + 3304], rax
	mov rax, 79
	mov qword ptr [rbp + 3384], rax
	mov rax, 80
	mov qword ptr [rbp + 3456], rax
	mov rax, 81
	mov qword ptr [rbp + 3536], rax
	mov rax, 82
	mov qword ptr [rbp + 3608], rax
	mov rax, 83
	mov qword ptr [rbp + 3696], rax
	mov rax, 84
	mov qword ptr [rbp + 3768], rax
	mov rax, 85
	mov qword ptr [rbp + 3832], rax
	mov rax, 86
	mov qword ptr [rbp + 3904], rax
	mov rax, 87
	mov qword ptr [rbp + 4000], rax
	mov rax, 88
	mov qword ptr [rbp + 4080], rax
	mov rax, 89
	mov qword ptr [rbp + 4168], rax
	mov rax, 90
	mov qword ptr [rbp + 4256], rax
	mov rax, 91
	mov qword ptr [rbp + 4344], rax
	mov rax, 92
	mov qword ptr [rbp + 4416], rax
	mov rax, 93
	mov qword ptr [rbp + 4512], rax
	mov rax, 94
	mov qword ptr [rbp + 4624], rax
	mov rax, 95
	mov qword ptr [rbp + 4704], rax
	mov rax, 96
	mov qword ptr [rbp + 4776], rax
	mov rax, 97
	mov qword ptr [rbp + 4856], rax
	mov rax, 98
	mov qword ptr [rbp + 4928], rax
	mov rax, 99
	mov qword ptr [rbp + 5008], rax
	mov rax, 100
	mov qword ptr [rbp + 5104], rax
	mov rax, 101
	mov qword ptr [rbp + 5184], rax
	mov rax, 102
	mov qword ptr [rbp + 5264], rax
	mov rax, 103
	mov qword ptr [rbp + 5360], rax
	mov rax, 104
	mov qword ptr [rbp + 5424], rax
	mov rax, 105
	mov qword ptr [rbp + 5480], rax
	mov rax, 106
	mov qword ptr [rbp + 5544], rax
	mov rax, 107
	mov qword ptr [rbp + 5728], rax
	mov rax, 108
	mov qword ptr [rbp + 5832], rax
	mov rax, 109
	mov qword ptr [rbp + 5920], rax
	mov rax, 110
	mov qword ptr [rbp + 5992], rax
	mov rax, 111
	mov qword ptr [rbp + 6072], rax
	mov rax, 112
	mov qword ptr [rbp + 6168], rax
	mov rax, 113
	mov qword ptr [rbp + 6264], rax
	mov rax, 114
	mov qword ptr [rbp + 6344], rax
	mov rax, 115
	mov qword ptr [rbp + 6432], rax
	mov rax, 116
	mov qword ptr [rbp + 6528], rax
	mov rax, 117
	mov qword ptr [rbp + 6600], rax
	mov rax, 118
	mov qword ptr [rbp + 6672], rax
	mov rax, 119
	mov qword ptr [rbp + 6728], rax
	mov rax, 120
	mov qword ptr [rbp + 6808], rax
	mov rax, 121
	mov qword ptr [rbp + 6896], rax
	mov rax, 122
	mov qword ptr [rbp + 6984], rax
	mov rax, 123
	mov qword ptr [rbp + 7072], rax
	mov rax, 124
	mov qword ptr [rbp + 7152], rax
	mov rax, 125
	mov qword ptr [rbp + 7240], rax
	mov rax, 126
	mov qword ptr [rbp + 7328], rax
	mov rax, 127
	mov qword ptr [rbp + 7408], rax
	mov rax, 128
	mov qword ptr [rbp + 7496], rax
	mov rax, 129
	mov qword ptr [rbp + 7584], rax
	mov rax, 130
	mov qword ptr [rbp + 7672], rax
	mov rax, 131
	mov qword ptr [rbp + 7760], rax
	mov rax, 132
	mov qword ptr [rbp + 7832], rax
	mov rax, 133
	mov qword ptr [rbp + 7912], rax
	mov rax, 134
	mov qword ptr [rbp + 7984], rax
	mov rax, 135
	mov qword ptr [rbp + 8072], rax
	mov rax, 136
	mov qword ptr [rbp + 8144], rax
	mov rax, 137
	mov qword ptr [rbp + 8240], rax
	mov rax, 138
	mov qword ptr [rbp + 8336], rax
	mov rax, 139
	mov qword ptr [rbp + 8424], rax
	mov rax, 140
	mov qword ptr [rbp + 8504], rax
	mov rax, 141
	mov qword ptr [rbp + 8584], rax
	mov rax, 142
	mov qword ptr [rbp + 8656], rax
	mov rax, 143
	mov qword ptr [rbp + 8744], rax
	mov rax, 144
	mov qword ptr [rbp + 8832], rax
	mov rax, 145
	mov qword ptr [rbp + 8920], rax
	mov rax, 146
	mov qword ptr [rbp + 9008], rax
	mov rax, 147
	mov qword ptr [rbp + 9104], rax
	mov rax, 148
	mov qword ptr [rbp + 9176], rax
	mov rax, 149
	mov qword ptr [rbp + 9272], rax
	mov rax, 150
	mov qword ptr [rbp + 9352], rax
	mov rax, 151
	mov qword ptr [rbp + 9448], rax
	mov rax, 152
	mov qword ptr [rbp + 9536], rax
	mov rax, 153
	mov qword ptr [rbp + 9632], rax
	mov rax, 154
	mov qword ptr [rbp + 9712], rax
	mov rax, 155
	mov qword ptr [rbp + 10112], rax
	mov rax, 156
	mov qword ptr [rbp + 10184], rax
	mov rax, 157
	mov qword ptr [rbp + 10256], rax
	mov rax, 158
	mov qword ptr [rbp + 10344], rax
	mov rax, 159
	mov qword ptr [rbp + 10408], rax
	mov rax, 160
	mov qword ptr [rbp + 10488], rax
	mov rax, 161
	mov qword ptr [rbp + 10592], rax
	mov rax, 162
	mov qword ptr [rbp + 10664], rax
	mov rax, 163
	mov qword ptr [rbp + 10736], rax
	mov rax, 164
	mov qword ptr [rbp + 10824], rax
	mov rax, 165
	mov qword ptr [rbp + 10872], rax
	mov rax, 166
	mov qword ptr [rbp + 10952], rax
	mov rax, 167
	mov qword ptr [rbp + 11008], rax
	mov rax, 168
	mov qword ptr [rbp + 11072], rax
	mov rax, 169
	mov qword ptr [rbp + 11128], rax
	mov rax, 170
	mov qword ptr [rbp + 11176], rax
	mov rax, 171
	mov qword ptr [rbp + 11248], rax
	mov rax, 172
	mov qword ptr [rbp + 11304], rax
	mov rax, 173
	mov qword ptr [rbp + 11416], rax
	mov rax, 174
	mov qword ptr [rbp + 11448], rax
	mov rax, 175
	mov qword ptr [rbp + 11496], rax
	mov rax, 176
	mov qword ptr [rbp + 11576], rax
	mov rax, 177
	mov qword ptr [rbp + 11664], rax
	mov rax, 178
	mov qword ptr [rbp + 11744], rax
	mov rax, 179
	mov qword ptr [rbp + 11832], rax
	mov rax, 180
	mov qword ptr [rbp + 11904], rax
	mov rax, 181
	mov qword ptr [rbp + 11992], rax
	mov rax, 182
	mov qword ptr [rbp + 12080], rax
	mov rax, 183
	mov qword ptr [rbp + 12168], rax
	mov rax, 184
	mov qword ptr [rbp + 12248], rax
	mov rax, 185
	mov qword ptr [rbp + 12328], rax
	mov rax, 186
	mov qword ptr [rbp + 12400], rax
	mov rax, 187
	mov qword ptr [rbp + 12504], rax
	mov rax, 188
	mov qword ptr [rbp + 12528], rax
	mov rax, 189
	mov qword ptr [rbp + 12608], rax
	mov rax, 190
	mov qword ptr [rbp + 12680], rax
	mov rax, 191
	mov qword ptr [rbp + 12752], rax
	mov rax, 192
	mov qword ptr [rbp + 12832], rax
	mov rax, 193
	mov qword ptr [rbp + 12904], rax
	mov rax, 194
	mov qword ptr [rbp + 12976], rax
	mov rax, 195
	mov qword ptr [rbp + 13048], rax
	mov rax, 196
	mov qword ptr [rbp + 13112], rax
	mov rax, 197
	mov qword ptr [rbp + 13176], rax
	mov rax, 198
	mov qword ptr [rbp + 13240], rax
	mov rax, 199
	mov qword ptr [rbp + 13320], rax
	mov rax, 200
	mov qword ptr [rbp + 13384], rax
	mov rax, 201
	mov qword ptr [rbp + 13432], rax
	mov rax, 202
	mov qword ptr [rbp + 13504], rax
	mov rax, 203
	mov qword ptr [rbp + 13568], rax
	mov rax, 204
	mov qword ptr [rbp + 13648], rax
	mov rax, 205
	mov qword ptr [rbp + 13712], rax
	mov rax, 206
	mov qword ptr [rbp + 13792], rax
	mov rax, 207
	mov qword ptr [rbp + 13848], rax
	mov rax, 208
	mov qword ptr [rbp + 13920], rax
	mov rax, 209
	mov qword ptr [rbp + 14000], rax
	mov rax, 210
	mov qword ptr [rbp + 14072], rax
	mov rax, 211
	mov qword ptr [rbp + 14136], rax
	mov rax, 212
	mov qword ptr [rbp + 14224], rax
	mov rax, 213
	mov qword ptr [rbp + 14296], rax
	mov rax, 214
	mov qword ptr [rbp + 14368], rax
	mov rax, 215
	mov qword ptr [rbp + 14408], rax
	mov rax, 216
	mov qword ptr [rbp + 14488], rax
	mov rax, 217
	mov qword ptr [rbp + 14560], rax
	mov rax, 218
	mov qword ptr [rbp + 14632], rax
	mov rax, 219
	mov qword ptr [rbp + 14688], rax
	mov rax, 220
	mov qword ptr [rbp + 14760], rax
	mov rax, 221
	mov qword ptr [rbp + 14840], rax
	mov rax, 222
	mov qword ptr [rbp + 14880], rax
	mov rax, 223
	mov qword ptr [rbp + 14960], rax
	mov rax, 224
	mov qword ptr [rbp + 15008], rax
	mov rax, 225
	mov qword ptr [rbp + 15064], rax
	mov rax, 226
	mov qword ptr [rbp + 15128], rax
	mov rax, 227
	mov qword ptr [rbp + 15176], rax
	mov rax, 228
	mov qword ptr [rbp + 15224], rax
	mov rax, 229
	mov qword ptr [rbp + 15272], rax
	mov rax, 230
	mov qword ptr [rbp + 15336], rax
	mov rax, 231
	mov qword ptr [rbp + 15376], rax
	mov rax, 232
	mov qword ptr [rbp + 15424], rax
	mov rax, 233
	mov qword ptr [rbp + 15480], rax
	mov rax, 234
	mov qword ptr [rbp + 15536], rax
	mov rax, 235
	mov qword ptr [rbp + 15592], rax
	mov rax, 236
	mov qword ptr [rbp + 15648], rax
	mov rax, 237
	mov qword ptr [rbp + 15672], rax
	mov rax, 238
	mov qword ptr [rbp + 15720], rax
	mov rax, 239
	mov qword ptr [rbp + 15744], rax
	mov rax, 240
	mov qword ptr [rbp + 15784], rax
	mov rax, 241
	mov qword ptr [rbp + 15824], rax
	mov rax, 242
	mov qword ptr [rbp + 15864], rax
	mov rax, 243
	mov qword ptr [rbp + 15896], rax
	mov rax, 244
	mov qword ptr [rbp + 15936], rax
	mov rax, 245
	mov qword ptr [rbp + 15968], rax
	mov rax, 246
	mov qword ptr [rbp + 16024], rax
	mov rax, 247
	mov qword ptr [rbp + 16040], rax
	mov rax, 248
	mov qword ptr [rbp + 16096], rax
	mov rax, 249
	mov qword ptr [rbp + 16120], rax
	mov rax, 250
	mov qword ptr [rbp + 16160], rax
	mov rax, 251
	mov qword ptr [rbp + 16184], rax
	mov rax, 252
	mov qword ptr [rbp + 16224], rax
	mov rax, 253
	mov qword ptr [rbp + 16280], rax
	mov rax, 254
	mov qword ptr [rbp + 16320], rax
	mov rax, 255
	mov qword ptr [rbp + 16376], rax
	mov rax, 256
	mov qword ptr [rbp + 16432], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2048], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 1920], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1848], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1784], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1736], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1672], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1616], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1496], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1416], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1352], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1304], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1240], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1160], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1096], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1016], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 944], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 888], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 824], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 648], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 584], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 504], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 448], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 360], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 248], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 168], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 80], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 8], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp + 56], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp + 112], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp + 184], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp + 288], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp + 336], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp + 424], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp + 488], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp + 536], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp + 616], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp + 680], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 752], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 824], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 904], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 976], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 1048], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 1104], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 1160], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 1200], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 1248], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 1464], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 1496], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 1520], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 1552], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 1560], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 1616], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 1680], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 1768], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 1824], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 1888], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 1944], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 2016], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 2080], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 2152], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 2240], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 2312], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 2400], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 2464], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 2520], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 2592], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 2648], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2720], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2800], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 2896], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 2960], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 3032], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 3120], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 3208], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 3304], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 3384], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 3456], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 3536], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 3608], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 3696], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 3768], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 3832], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 3904], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 4000], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 4080], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 4168], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 4256], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 4344], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 4416], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 4512], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 4624], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 4704], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 4776], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 4856], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 4928], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 5008], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 5104], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 5184], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 5264], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 5360], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 5424], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 5480], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 5544], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 5728], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 5832], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 5920], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 5992], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 6072], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 6168], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 6264], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 6344], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 6432], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 6528], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 6600], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 6672], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 6728], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 6808], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 6896], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 6984], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 7072], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 7152], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 7240], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 7328], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 7408], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 7496], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 7584], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 7672], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 7760], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 7832], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 7912], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 7984], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 8072], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 8144], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 8240], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 8336], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 8424], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 8504], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 8584], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 8656], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 8744], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 8832], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 8920], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 9008], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 9104], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 9176], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 9272], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 9352], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 9448], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 9536], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 9632], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 9712], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 10112], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 10184], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 10256], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 10344], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 10408], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 10488], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 10592], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 10664], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 10736], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 10824], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 10872], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 10952], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 11008], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 11072], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 11128], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 11176], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 11248], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 11304], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 11416], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 11448], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 11496], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 11576], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 11664], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 11744], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 11832], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 11904], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 11992], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 12080], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 12168], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 12248], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 12328], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 12400], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 12504], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 12528], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 12608], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 12680], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 12752], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 12832], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 12904], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 12976], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 13048], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 13112], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 13176], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 13240], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 13320], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 13384], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 13432], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 13504], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 13568], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 13648], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 13712], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 13792], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 13848], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 13920], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 14000], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 14072], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 14136], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 14224], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 14296], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 14368], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 14408], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 14488], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 14560], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 14632], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 14688], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 14760], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 14840], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 14880], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 14960], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 15008], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 15064], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 15128], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 15176], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 15224], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 15272], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 15336], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 15376], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 15424], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 15480], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 15536], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 15592], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 15648], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 15672], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 15720], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 15744], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 15784], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 15824], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 15864], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 15896], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 15936], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 15968], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 16024], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 16040], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 16096], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 16120], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 16160], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 16184], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 16224], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 16280], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 16320], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 16376], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 16432], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f6:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2088]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 2024]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1984]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1952]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1896]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1832]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1800]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1712]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1640]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1616]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1504]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1432]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1368]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1320]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1264]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 1216]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 1152]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 1080]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 1024]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 968]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 904]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 848]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 808]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 736]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 696]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 632]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 592]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 536]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 480]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp - 432]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp - 384]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp - 320]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp - 288]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp - 232]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp - 160]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp - 72]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp - 16]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 40]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 88]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 144]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 208]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 256]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 304]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 360]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 408]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 456]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 512]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 576]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 624]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 672]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 736]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 832]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 896]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 952]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 1008]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 1064]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 1216]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 1264]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 1592]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 1656]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 1704]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 1768]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 1816]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 1864]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 1912]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 2000]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 2056]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2112]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2168]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 2232]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 2304]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 2376]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 2408]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 2480]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 2544]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 2584]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 2632]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 2688]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 2760]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 2816]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 2872]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 2936]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 2976]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 3048]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 3104]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 3160]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 3224]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 3280]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 3360]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 3440]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 3520]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 3600]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 3672]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 3728]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 3800]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 3856]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 3944]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 4016]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 4072]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 4192]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 4256]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 4320]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 4384]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 4456]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 4536]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 4600]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 4680]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 4752]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 4824]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 4896]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 4968]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 5032]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 5088]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 5168]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 5240]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 5296]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 5368]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 5448]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 5520]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 5664]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 5744]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 5808]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 5880]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 5936]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 6008]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 6088]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 6160]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 6232]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 6296]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 6368]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 6440]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 6512]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 6576]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 6632]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 6696]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 6760]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 6824]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 6888]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 6960]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 7032]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 7088]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 7152]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 7216]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 7296]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 7360]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 7440]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 7504]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 7576]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 7648]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 7720]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 7808]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 7856]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 7920]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 8000]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 8064]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 8128]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 8192]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 8280]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 8344]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 8408]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 8456]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 8536]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 8616]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 8688]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 8752]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 8816]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 8896]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 8952]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 9016]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 9096]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 9168]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 9232]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 9296]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 9360]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 9424]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 9504]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 9568]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 9640]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 9696]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 9768]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 9816]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 9880]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 9952]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 10016]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 10072]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 10136]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 10216]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 10288]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 10368]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 10424]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 10496]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 10560]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 10648]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 10728]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 10792]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 10880]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 10968]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 11040]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 11120]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 11208]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 11280]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 11424]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 11520]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 11592]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 11656]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 11728]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 11792]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 11856]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 11920]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 11984]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 12056]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 12120]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 12176]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 12256]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 12336]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 12416]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 12488]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 12568]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 12624]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 12704]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 12776]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 12840]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 12888]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 12968]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 13056]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 13136]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 13192]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 13264]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 13336]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 13416]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 13480]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 13552]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 13608]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 13680]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 13752]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 13832]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 13888]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 13968]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 14040]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 14112]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 14192]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 14240]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 14304]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 14384]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 14456]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 14504]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 14568]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 14640]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 14704]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 14768]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 14832]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 14888]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 14944]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2088], rax
	mov rax, 5
	mov qword ptr [rbp - 2024], rax
	mov rax, 6
	mov qword ptr [rbp - 1984], rax
	mov rax, 7
	mov qword ptr [rbp - 1952], rax
	mov rax, 8
	mov qword ptr [rbp - 1896], rax
	mov rax, 9
	mov qword ptr [rbp - 1832], rax
	mov rax, 10
	mov qword ptr [rbp - 1800], rax
	mov rax, 11
	mov qword ptr [rbp - 1712], rax
	mov rax, 12
	mov qword ptr [rbp - 1640], rax
	mov rax, 13
	mov qword ptr [rbp - 1616], rax
	mov rax, 14
	mov qword ptr [rbp - 1504], rax
	mov rax, 15
	mov qword ptr [rbp - 1432], rax
	mov rax, 16
	mov qword ptr [rbp + 16632], rax
	mov rax, 17
	mov qword ptr [rbp - 1320], rax
	mov rax, 18
	mov qword ptr [rbp - 1264], rax
	mov rax, 19
	mov qword ptr [rbp - 1216], rax
	mov rax, 20
	mov qword ptr [rbp - 1152], rax
	mov rax, 21
	mov qword ptr [rbp - 1080], rax
	mov rax, 22
	mov qword ptr [rbp - 1024], rax
	mov rax, 23
	mov qword ptr [rbp - 968], rax
	mov rax, 24
	mov qword ptr [rbp - 904], rax
	mov rax, 25
	mov qword ptr [rbp - 848], rax
	mov rax, 26
	mov qword ptr [rbp - 808], rax
	mov rax, 27
	mov qword ptr [rbp - 736], rax
	mov rax, 28
	mov qword ptr [rbp - 696], rax
	mov rax, 29
	mov qword ptr [rbp + 16968], rax
	mov rax, 30
	mov qword ptr [rbp - 592], rax
	mov rax, 31
	mov qword ptr [rbp - 536], rax
	mov rax, 32
	mov qword ptr [rbp - 480], rax
	mov rax, 33
	mov qword ptr [rbp - 432], rax
	mov rax, 34
	mov qword ptr [rbp - 384], rax
	mov rax, 35
	mov qword ptr [rbp - 320], rax
	mov rax, 36
	mov qword ptr [rbp - 288], rax
	mov rax, 37
	mov qword ptr [rbp - 232], rax
	mov rax, 38
	mov qword ptr [rbp - 160], rax
	mov rax, 39
	mov qword ptr [rbp - 72], rax
	mov rax, 40
	mov qword ptr [rbp - 16], rax
	mov rax, 41
	mov qword ptr [rbp + 40], rax
	mov rax, 42
	mov qword ptr [rbp + 88], rax
	mov rax, 43
	mov qword ptr [rbp + 144], rax
	mov rax, 44
	mov qword ptr [rbp + 208], rax
	mov rax, 45
	mov qword ptr [rbp + 256], rax
	mov rax, 46
	mov qword ptr [rbp + 304], rax
	mov rax, 47
	mov qword ptr [rbp + 360], rax
	mov rax, 48
	mov qword ptr [rbp + 408], rax
	mov rax, 49
	mov qword ptr [rbp + 456], rax
	mov rax, 50
	mov qword ptr [rbp + 512], rax
	mov rax, 51
	mov qword ptr [rbp + 576], rax
	mov rax, 52
	mov qword ptr [rbp + 624], rax
	mov rax, 53
	mov qword ptr [rbp + 672], rax
	mov rax, 54
	mov qword ptr [rbp + 736], rax
	mov rax, 55
	mov qword ptr [rbp + 832], rax
	mov rax, 56
	mov qword ptr [rbp + 896], rax
	mov rax, 57
	mov qword ptr [rbp + 952], rax
	mov rax, 58
	mov qword ptr [rbp + 1008], rax
	mov rax, 59
	mov qword ptr [rbp + 1064], rax
	mov rax, 60
	mov qword ptr [rbp + 1216], rax
	mov rax, 61
	mov qword ptr [rbp + 1264], rax
	mov rax, 62
	mov qword ptr [rbp + 1592], rax
	mov rax, 63
	mov qword ptr [rbp + 1656], rax
	mov rax, 64
	mov qword ptr [rbp + 1704], rax
	mov rax, 65
	mov qword ptr [rbp + 1768], rax
	mov rax, 66
	mov qword ptr [rbp + 1816], rax
	mov rax, 67
	mov qword ptr [rbp + 1864], rax
	mov rax, 68
	mov qword ptr [rbp + 1912], rax
	mov rax, 69
	mov qword ptr [rbp + 2000], rax
	mov rax, 70
	mov qword ptr [rbp + 2056], rax
	mov rax, 71
	mov qword ptr [rbp + 2112], rax
	mov rax, 72
	mov qword ptr [rbp + 2168], rax
	mov rax, 73
	mov qword ptr [rbp + 2232], rax
	mov rax, 74
	mov qword ptr [rbp + 2304], rax
	mov rax, 75
	mov qword ptr [rbp + 2376], rax
	mov rax, 76
	mov qword ptr [rbp + 2408], rax
	mov rax, 77
	mov qword ptr [rbp + 2480], rax
	mov rax, 78
	mov qword ptr [rbp + 2544], rax
	mov rax, 79
	mov qword ptr [rbp + 2584], rax
	mov rax, 80
	mov qword ptr [rbp + 2632], rax
	mov rax, 81
	mov qword ptr [rbp + 2688], rax
	mov rax, 82
	mov qword ptr [rbp + 2760], rax
	mov rax, 83
	mov qword ptr [rbp + 2816], rax
	mov rax, 84
	mov qword ptr [rbp + 2872], rax
	mov rax, 85
	mov qword ptr [rbp + 2936], rax
	mov rax, 86
	mov qword ptr [rbp + 2976], rax
	mov rax, 87
	mov qword ptr [rbp + 3048], rax
	mov rax, 88
	mov qword ptr [rbp + 3104], rax
	mov rax, 89
	mov qword ptr [rbp + 3160], rax
	mov rax, 90
	mov qword ptr [rbp + 3224], rax
	mov rax, 91
	mov qword ptr [rbp + 3280], rax
	mov rax, 92
	mov qword ptr [rbp + 3360], rax
	mov rax, 93
	mov qword ptr [rbp + 3440], rax
	mov rax, 94
	mov qword ptr [rbp + 3520], rax
	mov rax, 95
	mov qword ptr [rbp + 3600], rax
	mov rax, 96
	mov qword ptr [rbp + 3672], rax
	mov rax, 97
	mov qword ptr [rbp + 3728], rax
	mov rax, 98
	mov qword ptr [rbp + 3800], rax
	mov rax, 99
	mov qword ptr [rbp + 3856], rax
	mov rax, 100
	mov qword ptr [rbp + 3944], rax
	mov rax, 101
	mov qword ptr [rbp + 4016], rax
	mov rax, 102
	mov qword ptr [rbp + 4072], rax
	mov rax, 103
	mov qword ptr [rbp + 4192], rax
	mov rax, 104
	mov qword ptr [rbp + 4256], rax
	mov rax, 105
	mov qword ptr [rbp + 4320], rax
	mov rax, 106
	mov qword ptr [rbp + 4384], rax
	mov rax, 107
	mov qword ptr [rbp + 4456], rax
	mov rax, 108
	mov qword ptr [rbp + 4536], rax
	mov rax, 109
	mov qword ptr [rbp + 4600], rax
	mov rax, 110
	mov qword ptr [rbp + 4680], rax
	mov rax, 111
	mov qword ptr [rbp + 4752], rax
	mov rax, 112
	mov qword ptr [rbp + 4824], rax
	mov rax, 113
	mov qword ptr [rbp + 4896], rax
	mov rax, 114
	mov qword ptr [rbp + 4968], rax
	mov rax, 115
	mov qword ptr [rbp + 5032], rax
	mov rax, 116
	mov qword ptr [rbp + 5088], rax
	mov rax, 117
	mov qword ptr [rbp + 5168], rax
	mov rax, 118
	mov qword ptr [rbp + 5240], rax
	mov rax, 119
	mov qword ptr [rbp + 5296], rax
	mov rax, 120
	mov qword ptr [rbp + 5368], rax
	mov rax, 121
	mov qword ptr [rbp + 5448], rax
	mov rax, 122
	mov qword ptr [rbp + 5520], rax
	mov rax, 123
	mov qword ptr [rbp + 5664], rax
	mov rax, 124
	mov qword ptr [rbp + 5744], rax
	mov rax, 125
	mov qword ptr [rbp + 5808], rax
	mov rax, 126
	mov qword ptr [rbp + 5880], rax
	mov rax, 127
	mov qword ptr [rbp + 5936], rax
	mov rax, 128
	mov qword ptr [rbp + 6008], rax
	mov rax, 129
	mov qword ptr [rbp + 6088], rax
	mov rax, 130
	mov qword ptr [rbp + 6160], rax
	mov rax, 131
	mov qword ptr [rbp + 6232], rax
	mov rax, 132
	mov qword ptr [rbp + 6296], rax
	mov rax, 133
	mov qword ptr [rbp + 6368], rax
	mov rax, 134
	mov qword ptr [rbp + 6440], rax
	mov rax, 135
	mov qword ptr [rbp + 6512], rax
	mov rax, 136
	mov qword ptr [rbp + 6576], rax
	mov rax, 137
	mov qword ptr [rbp + 6632], rax
	mov rax, 138
	mov qword ptr [rbp + 6696], rax
	mov rax, 139
	mov qword ptr [rbp + 6760], rax
	mov rax, 140
	mov qword ptr [rbp + 6824], rax
	mov rax, 141
	mov qword ptr [rbp + 6888], rax
	mov rax, 142
	mov qword ptr [rbp + 6960], rax
	mov rax, 143
	mov qword ptr [rbp + 7032], rax
	mov rax, 144
	mov qword ptr [rbp + 7088], rax
	mov rax, 145
	mov qword ptr [rbp + 7152], rax
	mov rax, 146
	mov qword ptr [rbp + 7216], rax
	mov rax, 147
	mov qword ptr [rbp + 7296], rax
	mov rax, 148
	mov qword ptr [rbp + 7360], rax
	mov rax, 149
	mov qword ptr [rbp + 7440], rax
	mov rax, 150
	mov qword ptr [rbp + 7504], rax
	mov rax, 151
	mov qword ptr [rbp + 7576], rax
	mov rax, 152
	mov qword ptr [rbp + 7648], rax
	mov rax, 153
	mov qword ptr [rbp + 7720], rax
	mov rax, 154
	mov qword ptr [rbp + 7808], rax
	mov rax, 155
	mov qword ptr [rbp + 7856], rax
	mov rax, 156
	mov qword ptr [rbp + 7920], rax
	mov rax, 157
	mov qword ptr [rbp + 8000], rax
	mov rax, 158
	mov qword ptr [rbp + 8064], rax
	mov rax, 159
	mov qword ptr [rbp + 8128], rax
	mov rax, 160
	mov qword ptr [rbp + 8192], rax
	mov rax, 161
	mov qword ptr [rbp + 8280], rax
	mov rax, 162
	mov qword ptr [rbp + 8344], rax
	mov rax, 163
	mov qword ptr [rbp + 8408], rax
	mov rax, 164
	mov qword ptr [rbp + 8456], rax
	mov rax, 165
	mov qword ptr [rbp + 8536], rax
	mov rax, 166
	mov qword ptr [rbp + 8616], rax
	mov rax, 167
	mov qword ptr [rbp + 8688], rax
	mov rax, 168
	mov qword ptr [rbp + 8752], rax
	mov rax, 169
	mov qword ptr [rbp + 8816], rax
	mov rax, 170
	mov qword ptr [rbp + 8896], rax
	mov rax, 171
	mov qword ptr [rbp + 8952], rax
	mov rax, 172
	mov qword ptr [rbp + 9016], rax
	mov rax, 173
	mov qword ptr [rbp + 9096], rax
	mov rax, 174
	mov qword ptr [rbp + 9168], rax
	mov rax, 175
	mov qword ptr [rbp + 9232], rax
	mov rax, 176
	mov qword ptr [rbp + 9296], rax
	mov rax, 177
	mov qword ptr [rbp + 9360], rax
	mov rax, 178
	mov qword ptr [rbp + 9424], rax
	mov rax, 179
	mov qword ptr [rbp + 9504], rax
	mov rax, 180
	mov qword ptr [rbp + 9568], rax
	mov rax, 181
	mov qword ptr [rbp + 9640], rax
	mov rax, 182
	mov qword ptr [rbp + 9696], rax
	mov rax, 183
	mov qword ptr [rbp + 9768], rax
	mov rax, 184
	mov qword ptr [rbp + 9816], rax
	mov rax, 185
	mov qword ptr [rbp + 9880], rax
	mov rax, 186
	mov qword ptr [rbp + 9952], rax
	mov rax, 187
	mov qword ptr [rbp + 10016], rax
	mov rax, 188
	mov qword ptr [rbp + 10072], rax
	mov rax, 189
	mov qword ptr [rbp + 10136], rax
	mov rax, 190
	mov qword ptr [rbp + 10216], rax
	mov rax, 191
	mov qword ptr [rbp + 10288], rax
	mov rax, 192
	mov qword ptr [rbp + 10368], rax
	mov rax, 193
	mov qword ptr [rbp + 10424], rax
	mov rax, 194
	mov qword ptr [rbp + 10496], rax
	mov rax, 195
	mov qword ptr [rbp + 10560], rax
	mov rax, 196
	mov qword ptr [rbp + 10648], rax
	mov rax, 197
	mov qword ptr [rbp + 10728], rax
	mov rax, 198
	mov qword ptr [rbp + 10792], rax
	mov rax, 199
	mov qword ptr [rbp + 10880], rax
	mov rax, 200
	mov qword ptr [rbp + 10968], rax
	mov rax, 201
	mov qword ptr [rbp + 11040], rax
	mov rax, 202
	mov qword ptr [rbp + 11120], rax
	mov rax, 203
	mov qword ptr [rbp + 11208], rax
	mov rax, 204
	mov qword ptr [rbp + 11280], rax
	mov rax, 205
	mov qword ptr [rbp + 11424], rax
	mov rax, 206
	mov qword ptr [rbp + 11520], rax
	mov rax, 207
	mov qword ptr [rbp + 11592], rax
	mov rax, 208
	mov qword ptr [rbp + 11656], rax
	mov rax, 209
	mov qword ptr [rbp + 11728], rax
	mov rax, 210
	mov qword ptr [rbp + 11792], rax
	mov rax, 211
	mov qword ptr [rbp + 11856], rax
	mov rax, 212
	mov qword ptr [rbp + 11920], rax
	mov rax, 213
	mov qword ptr [rbp + 11984], rax
	mov rax, 214
	mov qword ptr [rbp + 12056], rax
	mov rax, 215
	mov qword ptr [rbp + 12120], rax
	mov rax, 216
	mov qword ptr [rbp + 12176], rax
	mov rax, 217
	mov qword ptr [rbp + 12256], rax
	mov rax, 218
	mov qword ptr [rbp + 12336], rax
	mov rax, 219
	mov qword ptr [rbp + 12416], rax
	mov rax, 220
	mov qword ptr [rbp + 12488], rax
	mov rax, 221
	mov qword ptr [rbp + 12568], rax
	mov rax, 222
	mov qword ptr [rbp + 12624], rax
	mov rax, 223
	mov qword ptr [rbp + 12704], rax
	mov rax, 224
	mov qword ptr [rbp + 12776], rax
	mov rax, 225
	mov qword ptr [rbp + 12840], rax
	mov rax, 226
	mov qword ptr [rbp + 12888], rax
	mov rax, 227
	mov qword ptr [rbp + 12968], rax
	mov rax, 228
	mov qword ptr [rbp + 13056], rax
	mov rax, 229
	mov qword ptr [rbp + 13136], rax
	mov rax, 230
	mov qword ptr [rbp + 13192], rax
	mov rax, 231
	mov qword ptr [rbp + 13264], rax
	mov rax, 232
	mov qword ptr [rbp + 13336], rax
	mov rax, 233
	mov qword ptr [rbp + 13416], rax
	mov rax, 234
	mov qword ptr [rbp + 13480], rax
	mov rax, 235
	mov qword ptr [rbp + 13552], rax
	mov rax, 236
	mov qword ptr [rbp + 13608], rax
	mov rax, 237
	mov qword ptr [rbp + 13680], rax
	mov rax, 238
	mov qword ptr [rbp + 13752], rax
	mov rax, 239
	mov qword ptr [rbp + 13832], rax
	mov rax, 240
	mov qword ptr [rbp + 13888], rax
	mov rax, 241
	mov qword ptr [rbp + 13968], rax
	mov rax, 242
	mov qword ptr [rbp + 14040], rax
	mov rax, 243
	mov qword ptr [rbp + 14112], rax
	mov rax, 244
	mov qword ptr [rbp + 14192], rax
	mov rax, 245
	mov qword ptr [rbp + 14240], rax
	mov rax, 246
	mov qword ptr [rbp + 14304], rax
	mov rax, 247
	mov qword ptr [rbp + 14384], rax
	mov rax, 248
	mov qword ptr [rbp + 14456], rax
	mov rax, 249
	mov qword ptr [rbp + 14504], rax
	mov rax, 250
	mov qword ptr [rbp + 14568], rax
	mov rax, 251
	mov qword ptr [rbp + 14640], rax
	mov rax, 252
	mov qword ptr [rbp + 14704], rax
	mov rax, 253
	mov qword ptr [rbp + 14768], rax
	mov rax, 254
	mov qword ptr [rbp + 14832], rax
	mov rax, 255
	mov qword ptr [rbp + 14888], rax
	mov rax, 256
	mov qword ptr [rbp + 14944], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2088], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 2024], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1984], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1952], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1896], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1832], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1800], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1712], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1640], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1616], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1504], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1432], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp + 16632], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1320], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1264], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 1216], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 1152], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 1080], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 1024], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 968], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 904], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 848], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 808], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 736], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 696], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp + 16968], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 592], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 536], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 480], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp - 432], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp - 384], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp - 320], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp - 288], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp - 232], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp - 160], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp - 72], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp - 16], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 40], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 88], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 144], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 208], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 256], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 304], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 360], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 408], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 456], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 512], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 576], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 624], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 672], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 736], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 832], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 896], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 952], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 1008], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 1064], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 1216], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 1264], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 1592], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 1656], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 1704], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 1768], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 1816], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 1864], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 1912], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 2000], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 2056], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2112], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2168], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 2232], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 2304], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 2376], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 2408], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 2480], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 2544], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 2584], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 2632], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 2688], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 2760], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 2816], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 2872], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 2936], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 2976], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 3048], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 3104], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 3160], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 3224], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 3280], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 3360], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 3440], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 3520], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 3600], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 3672], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 3728], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 3800], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 3856], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 3944], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 4016], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 4072], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 4192], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 4256], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 4320], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 4384], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 4456], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 4536], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 4600], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 4680], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 4752], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 4824], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 4896], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 4968], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 5032], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 5088], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 5168], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 5240], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 5296], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 5368], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 5448], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 5520], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 5664], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 5744], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 5808], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 5880], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 5936], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 6008], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 6088], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 6160], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 6232], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 6296], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 6368], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 6440], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 6512], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 6576], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 6632], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 6696], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 6760], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 6824], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 6888], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 6960], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 7032], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 7088], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 7152], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 7216], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 7296], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 7360], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 7440], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 7504], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 7576], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 7648], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 7720], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 7808], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 7856], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 7920], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 8000], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 8064], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 8128], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 8192], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 8280], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 8344], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 8408], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 8456], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 8536], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 8616], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 8688], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 8752], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 8816], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 8896], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 8952], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 9016], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 9096], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 9168], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 9232], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 9296], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 9360], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 9424], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 9504], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 9568], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 9640], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 9696], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 9768], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 9816], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 9880], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 9952], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 10016], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 10072], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 10136], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 10216], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 10288], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 10368], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 10424], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 10496], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 10560], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 10648], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 10728], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 10792], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 10880], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 10968], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 11040], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 11120], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 11208], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 11280], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 11424], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 11520], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 11592], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 11656], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 11728], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 11792], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 11856], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 11920], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 11984], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 12056], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 12120], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 12176], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 12256], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 12336], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 12416], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 12488], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 12568], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 12624], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 12704], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 12776], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 12840], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 12888], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 12968], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 13056], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 13136], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 13192], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 13264], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 13336], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 13416], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 13480], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 13552], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 13608], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 13680], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 13752], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 13832], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 13888], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 13968], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 14040], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 14112], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 14192], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 14240], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 14304], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 14384], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 14456], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 14504], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 14568], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 14640], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 14704], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 14768], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 14832], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 14888], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 14944], r10
	add rsp, 2064
	pop rbp
	ret

wacc_f3:
	push rbp
	sub rsp, 2064
	mov qword ptr [rsp], rbx
	mov qword ptr [rsp + 8], r12
	mov qword ptr [rsp + 16], r13
	mov qword ptr [rsp + 24], r14
	mov qword ptr [rsp + 32], r15
	mov r10, qword ptr [rbp - 2040]
	mov qword ptr [rsp + 40], r10
	mov r10, qword ptr [rbp - 1992]
	mov qword ptr [rsp + 48], r10
	mov r10, qword ptr [rbp - 1928]
	mov qword ptr [rsp + 56], r10
	mov r10, qword ptr [rbp - 1864]
	mov qword ptr [rsp + 64], r10
	mov r10, qword ptr [rbp - 1792]
	mov qword ptr [rsp + 72], r10
	mov r10, qword ptr [rbp - 1744]
	mov qword ptr [rsp + 80], r10
	mov r10, qword ptr [rbp - 1704]
	mov qword ptr [rsp + 88], r10
	mov r10, qword ptr [rbp - 1624]
	mov qword ptr [rsp + 96], r10
	mov r10, qword ptr [rbp - 1576]
	mov qword ptr [rsp + 104], r10
	mov r10, qword ptr [rbp - 1512]
	mov qword ptr [rsp + 112], r10
	mov r10, qword ptr [rbp - 1440]
	mov qword ptr [rsp + 120], r10
	mov r10, qword ptr [rbp - 1384]
	mov qword ptr [rsp + 128], r10
	mov r10, qword ptr [rbp - 1328]
	mov qword ptr [rsp + 136], r10
	mov r10, qword ptr [rbp - 1248]
	mov qword ptr [rsp + 144], r10
	mov r10, qword ptr [rbp - 1168]
	mov qword ptr [rsp + 152], r10
	mov r10, qword ptr [rbp - 1104]
	mov qword ptr [rsp + 160], r10
	mov r10, qword ptr [rbp - 1056]
	mov qword ptr [rsp + 168], r10
	mov r10, qword ptr [rbp - 992]
	mov qword ptr [rsp + 176], r10
	mov r10, qword ptr [rbp - 936]
	mov qword ptr [rsp + 184], r10
	mov r10, qword ptr [rbp - 880]
	mov qword ptr [rsp + 192], r10
	mov r10, qword ptr [rbp - 816]
	mov qword ptr [rsp + 200], r10
	mov r10, qword ptr [rbp - 744]
	mov qword ptr [rsp + 208], r10
	mov r10, qword ptr [rbp - 680]
	mov qword ptr [rsp + 216], r10
	mov r10, qword ptr [rbp - 608]
	mov qword ptr [rsp + 224], r10
	mov r10, qword ptr [rbp - 552]
	mov qword ptr [rsp + 232], r10
	mov r10, qword ptr [rbp - 488]
	mov qword ptr [rsp + 240], r10
	mov r10, qword ptr [rbp - 400]
	mov qword ptr [rsp + 248], r10
	mov r10, qword ptr [rbp - 336]
	mov qword ptr [rsp + 256], r10
	mov r10, qword ptr [rbp - 272]
	mov qword ptr [rsp + 264], r10
	mov r10, qword ptr [rbp - 192]
	mov qword ptr [rsp + 272], r10
	mov r10, qword ptr [rbp - 48]
	mov qword ptr [rsp + 280], r10
	mov r10, qword ptr [rbp + 48]
	mov qword ptr [rsp + 288], r10
	mov r10, qword ptr [rbp + 120]
	mov qword ptr [rsp + 296], r10
	mov r10, qword ptr [rbp + 200]
	mov qword ptr [rsp + 304], r10
	mov r10, qword ptr [rbp + 296]
	mov qword ptr [rsp + 312], r10
	mov r10, qword ptr [rbp + 352]
	mov qword ptr [rsp + 320], r10
	mov r10, qword ptr [rbp + 416]
	mov qword ptr [rsp + 328], r10
	mov r10, qword ptr [rbp + 480]
	mov qword ptr [rsp + 336], r10
	mov r10, qword ptr [rbp + 528]
	mov qword ptr [rsp + 344], r10
	mov r10, qword ptr [rbp + 600]
	mov qword ptr [rsp + 352], r10
	mov r10, qword ptr [rbp + 696]
	mov qword ptr [rsp + 360], r10
	mov r10, qword ptr [rbp + 760]
	mov qword ptr [rsp + 368], r10
	mov r10, qword ptr [rbp + 840]
	mov qword ptr [rsp + 376], r10
	mov r10, qword ptr [rbp + 912]
	mov qword ptr [rsp + 384], r10
	mov r10, qword ptr [rbp + 984]
	mov qword ptr [rsp + 392], r10
	mov r10, qword ptr [rbp + 1056]
	mov qword ptr [rsp + 400], r10
	mov r10, qword ptr [rbp + 1112]
	mov qword ptr [rsp + 408], r10
	mov r10, qword ptr [rbp + 1176]
	mov qword ptr [rsp + 416], r10
	mov r10, qword ptr [rbp + 1224]
	mov qword ptr [rsp + 424], r10
	mov r10, qword ptr [rbp + 1272]
	mov qword ptr [rsp + 432], r10
	mov r10, qword ptr [rbp + 1296]
	mov qword ptr [rsp + 440], r10
	mov r10, qword ptr [rbp + 1312]
	mov qword ptr [rsp + 448], r10
	mov r10, qword ptr [rbp + 1320]
	mov qword ptr [rsp + 456], r10
	mov r10, qword ptr [rbp + 1480]
	mov qword ptr [rsp + 464], r10
	mov r10, qword ptr [rbp + 1512]
	mov qword ptr [rsp + 472], r10
	mov r10, qword ptr [rbp + 1544]
	mov qword ptr [rsp + 480], r10
	mov r10, qword ptr [rbp + 1600]
	mov qword ptr [rsp + 488], r10
	mov r10, qword ptr [rbp + 1664]
	mov qword ptr [rsp + 496], r10
	mov r10, qword ptr [rbp + 1744]
	mov qword ptr [rsp + 504], r10
	mov r10, qword ptr [rbp + 1808]
	mov qword ptr [rsp + 512], r10
	mov r10, qword ptr [rbp + 1856]
	mov qword ptr [rsp + 520], r10
	mov r10, qword ptr [rbp + 1920]
	mov qword ptr [rsp + 528], r10
	mov r10, qword ptr [rbp + 1976]
	mov qword ptr [rsp + 536], r10
	mov r10, qword ptr [rbp + 2064]
	mov qword ptr [rsp + 544], r10
	mov r10, qword ptr [rbp + 2120]
	mov qword ptr [rsp + 552], r10
	mov r10, qword ptr [rbp + 2176]
	mov qword ptr [rsp + 560], r10
	mov r10, qword ptr [rbp + 2264]
	mov qword ptr [rsp + 568], r10
	mov r10, qword ptr [rbp + 2352]
	mov qword ptr [rsp + 576], r10
	mov r10, qword ptr [rbp + 2432]
	mov qword ptr [rsp + 584], r10
	mov r10, qword ptr [rbp + 2512]
	mov qword ptr [rsp + 592], r10
	mov r10, qword ptr [rbp + 2568]
	mov qword ptr [rsp + 600], r10
	mov r10, qword ptr [rbp + 2640]
	mov qword ptr [rsp + 608], r10
	mov r10, qword ptr [rbp + 2712]
	mov qword ptr [rsp + 616], r10
	mov r10, qword ptr [rbp + 2784]
	mov qword ptr [rsp + 624], r10
	mov r10, qword ptr [rbp + 2864]
	mov qword ptr [rsp + 632], r10
	mov r10, qword ptr [rbp + 2920]
	mov qword ptr [rsp + 640], r10
	mov r10, qword ptr [rbp + 2984]
	mov qword ptr [rsp + 648], r10
	mov r10, qword ptr [rbp + 3072]
	mov qword ptr [rsp + 656], r10
	mov r10, qword ptr [rbp + 3152]
	mov qword ptr [rsp + 664], r10
	mov r10, qword ptr [rbp + 3232]
	mov qword ptr [rsp + 672], r10
	mov r10, qword ptr [rbp + 3312]
	mov qword ptr [rsp + 680], r10
	mov r10, qword ptr [rbp + 3408]
	mov qword ptr [rsp + 688], r10
	mov r10, qword ptr [rbp + 3512]
	mov qword ptr [rsp + 696], r10
	mov r10, qword ptr [rbp + 3584]
	mov qword ptr [rsp + 704], r10
	mov r10, qword ptr [rbp + 3648]
	mov qword ptr [rsp + 712], r10
	mov r10, qword ptr [rbp + 3744]
	mov qword ptr [rsp + 720], r10
	mov r10, qword ptr [rbp + 3816]
	mov qword ptr [rsp + 728], r10
	mov r10, qword ptr [rbp + 3896]
	mov qword ptr [rsp + 736], r10
	mov r10, qword ptr [rbp + 3976]
	mov qword ptr [rsp + 744], r10
	mov r10, qword ptr [rbp + 4088]
	mov qword ptr [rsp + 752], r10
	mov r10, qword ptr [rbp + 4120]
	mov qword ptr [rsp + 760], r10
	mov r10, qword ptr [rbp + 4200]
	mov qword ptr [rsp + 768], r10
	mov r10, qword ptr [rbp + 4296]
	mov qword ptr [rsp + 776], r10
	mov r10, qword ptr [rbp + 4408]
	mov qword ptr [rsp + 784], r10
	mov r10, qword ptr [rbp + 4472]
	mov qword ptr [rsp + 792], r10
	mov r10, qword ptr [rbp + 4544]
	mov qword ptr [rsp + 800], r10
	mov r10, qword ptr [rbp + 4616]
	mov qword ptr [rsp + 808], r10
	mov r10, qword ptr [rbp + 4712]
	mov qword ptr [rsp + 816], r10
	mov r10, qword ptr [rbp + 4800]
	mov qword ptr [rsp + 824], r10
	mov r10, qword ptr [rbp + 4904]
	mov qword ptr [rsp + 832], r10
	mov r10, qword ptr [rbp + 4976]
	mov qword ptr [rsp + 840], r10
	mov r10, qword ptr [rbp + 5072]
	mov qword ptr [rsp + 848], r10
	mov r10, qword ptr [rbp + 5152]
	mov qword ptr [rsp + 856], r10
	mov r10, qword ptr [rbp + 5232]
	mov qword ptr [rsp + 864], r10
	mov r10, qword ptr [rbp + 5344]
	mov qword ptr [rsp + 872], r10
	mov r10, qword ptr [rbp + 5440]
	mov qword ptr [rsp + 880], r10
	mov r10, qword ptr [rbp + 5536]
	mov qword ptr [rsp + 888], r10
	mov r10, qword ptr [rbp + 5616]
	mov qword ptr [rsp + 896], r10
	mov r10, qword ptr [rbp + 5712]
	mov qword ptr [rsp + 904], r10
	mov r10, qword ptr [rbp + 5784]
	mov qword ptr [rsp + 912], r10
	mov r10, qword ptr [rbp + 5864]
	mov qword ptr [rsp + 920], r10
	mov r10, qword ptr [rbp + 5960]
	mov qword ptr [rsp + 928], r10
	mov r10, qword ptr [rbp + 6040]
	mov qword ptr [rsp + 936], r10
	mov r10, qword ptr [rbp + 6128]
	mov qword ptr [rsp + 944], r10
	mov r10, qword ptr [rbp + 6216]
	mov qword ptr [rsp + 952], r10
	mov r10, qword ptr [rbp + 6280]
	mov qword ptr [rsp + 960], r10
	mov r10, qword ptr [rbp + 6360]
	mov qword ptr [rsp + 968], r10
	mov r10, qword ptr [rbp + 6464]
	mov qword ptr [rsp + 976], r10
	mov r10, qword ptr [rbp + 6536]
	mov qword ptr [rsp + 984], r10
	mov r10, qword ptr [rbp + 6624]
	mov qword ptr [rsp + 992], r10
	mov r10, qword ptr [rbp + 6704]
	mov qword ptr [rsp + 1000], r10
	mov r10, qword ptr [rbp + 6800]
	mov qword ptr [rsp + 1008], r10
	mov r10, qword ptr [rbp + 6880]
	mov qword ptr [rsp + 1016], r10
	mov r10, qword ptr [rbp + 6968]
	mov qword ptr [rsp + 1024], r10
	mov r10, qword ptr [rbp + 7048]
	mov qword ptr [rsp + 1032], r10
	mov r10, qword ptr [rbp + 7136]
	mov qword ptr [rsp + 1040], r10
	mov r10, qword ptr [rbp + 7224]
	mov qword ptr [rsp + 1048], r10
	mov r10, qword ptr [rbp + 7312]
	mov qword ptr [rsp + 1056], r10
	mov r10, qword ptr [rbp + 7376]
	mov qword ptr [rsp + 1064], r10
	mov r10, qword ptr [rbp + 7456]
	mov qword ptr [rsp + 1072], r10
	mov r10, qword ptr [rbp + 7568]
	mov qword ptr [rsp + 1080], r10
	mov r10, qword ptr [rbp + 7656]
	mov qword ptr [rsp + 1088], r10
	mov r10, qword ptr [rbp + 7736]
	mov qword ptr [rsp + 1096], r10
	mov r10, qword ptr [rbp + 7824]
	mov qword ptr [rsp + 1104], r10
	mov r10, qword ptr [rbp + 7888]
	mov qword ptr [rsp + 1112], r10
	mov r10, qword ptr [rbp + 8088]
	mov qword ptr [rsp + 1120], r10
	mov r10, qword ptr [rbp + 8184]
	mov qword ptr [rsp + 1128], r10
	mov r10, qword ptr [rbp + 8272]
	mov qword ptr [rsp + 1136], r10
	mov r10, qword ptr [rbp + 8360]
	mov qword ptr [rsp + 1144], r10
	mov r10, qword ptr [rbp + 8448]
	mov qword ptr [rsp + 1152], r10
	mov r10, qword ptr [rbp + 8528]
	mov qword ptr [rsp + 1160], r10
	mov r10, qword ptr [rbp + 8624]
	mov qword ptr [rsp + 1168], r10
	mov r10, qword ptr [rbp + 8696]
	mov qword ptr [rsp + 1176], r10
	mov r10, qword ptr [rbp + 8784]
	mov qword ptr [rsp + 1184], r10
	mov r10, qword ptr [rbp + 8864]
	mov qword ptr [rsp + 1192], r10
	mov r10, qword ptr [rbp + 8992]
	mov qword ptr [rsp + 1200], r10
	mov r10, qword ptr [rbp + 9072]
	mov qword ptr [rsp + 1208], r10
	mov r10, qword ptr [rbp + 9160]
	mov qword ptr [rsp + 1216], r10
	mov r10, qword ptr [rbp + 9248]
	mov qword ptr [rsp + 1224], r10
	mov r10, qword ptr [rbp + 9328]
	mov qword ptr [rsp + 1232], r10
	mov r10, qword ptr [rbp + 9408]
	mov qword ptr [rsp + 1240], r10
	mov r10, qword ptr [rbp + 9488]
	mov qword ptr [rsp + 1248], r10
	mov r10, qword ptr [rbp + 9584]
	mov qword ptr [rsp + 1256], r10
	mov r10, qword ptr [rbp + 9672]
	mov qword ptr [rsp + 1264], r10
	mov r10, qword ptr [rbp + 9752]
	mov qword ptr [rsp + 1272], r10
	mov r10, qword ptr [rbp + 9832]
	mov qword ptr [rsp + 1280], r10
	mov r10, qword ptr [rbp + 9904]
	mov qword ptr [rsp + 1288], r10
	mov r10, qword ptr [rbp + 9984]
	mov qword ptr [rsp + 1296], r10
	mov r10, qword ptr [rbp + 10064]
	mov qword ptr [rsp + 1304], r10
	mov r10, qword ptr [rbp + 10152]
	mov qword ptr [rsp + 1312], r10
	mov r10, qword ptr [rbp + 10240]
	mov qword ptr [rsp + 1320], r10
	mov r10, qword ptr [rbp + 10312]
	mov qword ptr [rsp + 1328], r10
	mov r10, qword ptr [rbp + 10448]
	mov qword ptr [rsp + 1336], r10
	mov r10, qword ptr [rbp + 10544]
	mov qword ptr [rsp + 1344], r10
	mov r10, qword ptr [rbp + 10584]
	mov qword ptr [rsp + 1352], r10
	mov r10, qword ptr [rbp + 10656]
	mov qword ptr [rsp + 1360], r10
	mov r10, qword ptr [rbp + 10720]
	mov qword ptr [rsp + 1368], r10
	mov r10, qword ptr [rbp + 10776]
	mov qword ptr [rsp + 1376], r10
	mov r10, qword ptr [rbp + 10832]
	mov qword ptr [rsp + 1384], r10
	mov r10, qword ptr [rbp + 10888]
	mov qword ptr [rsp + 1392], r10
	mov r10, qword ptr [rbp + 10960]
	mov qword ptr [rsp + 1400], r10
	mov r10, qword ptr [rbp + 11016]
	mov qword ptr [rsp + 1408], r10
	mov r10, qword ptr [rbp + 11064]
	mov qword ptr [rsp + 1416], r10
	mov r10, qword ptr [rbp + 11136]
	mov qword ptr [rsp + 1424], r10
	mov r10, qword ptr [rbp + 11200]
	mov qword ptr [rsp + 1432], r10
	mov r10, qword ptr [rbp + 11256]
	mov qword ptr [rsp + 1440], r10
	mov r10, qword ptr [rbp + 11312]
	mov qword ptr [rsp + 1448], r10
	mov r10, qword ptr [rbp + 11360]
	mov qword ptr [rsp + 1456], r10
	mov r10, qword ptr [rbp + 11512]
	mov qword ptr [rsp + 1464], r10
	mov r10, qword ptr [rbp + 11600]
	mov qword ptr [rsp + 1472], r10
	mov r10, qword ptr [rbp + 11688]
	mov qword ptr [rsp + 1480], r10
	mov r10, qword ptr [rbp + 11776]
	mov qword ptr [rsp + 1488], r10
	mov r10, qword ptr [rbp + 11872]
	mov qword ptr [rsp + 1496], r10
	mov r10, qword ptr [rbp + 11928]
	mov qword ptr [rsp + 1504], r10
	mov r10, qword ptr [rbp + 12016]
	mov qword ptr [rsp + 1512], r10
	mov r10, qword ptr [rbp + 12136]
	mov qword ptr [rsp + 1520], r10
	mov r10, qword ptr [rbp + 12224]
	mov qword ptr [rsp + 1528], r10
	mov r10, qword ptr [rbp + 12288]
	mov qword ptr [rsp + 1536], r10
	mov r10, qword ptr [rbp + 12360]
	mov qword ptr [rsp + 1544], r10
	mov r10, qword ptr [rbp + 12448]
	mov qword ptr [rsp + 1552], r10
	mov r10, qword ptr [rbp + 12552]
	mov qword ptr [rsp + 1560], r10
	mov r10, qword ptr [rbp + 12640]
	mov qword ptr [rsp + 1568], r10
	mov r10, qword ptr [rbp + 12728]
	mov qword ptr [rsp + 1576], r10
	mov r10, qword ptr [rbp + 12808]
	mov qword ptr [rsp + 1584], r10
	mov r10, qword ptr [rbp + 12912]
	mov qword ptr [rsp + 1592], r10
	mov r10, qword ptr [rbp + 12984]
	mov qword ptr [rsp + 1600], r10
	mov r10, qword ptr [rbp + 13064]
	mov qword ptr [rsp + 1608], r10
	mov r10, qword ptr [rbp + 13144]
	mov qword ptr [rsp + 1616], r10
	mov r10, qword ptr [rbp + 13224]
	mov qword ptr [rsp + 1624], r10
	mov r10, qword ptr [rbp + 13296]
	mov qword ptr [rsp + 1632], r10
	mov r10, qword ptr [rbp + 13376]
	mov qword ptr [rsp + 1640], r10
	mov r10, qword ptr [rbp + 13456]
	mov qword ptr [rsp + 1648], r10
	mov r10, qword ptr [rbp + 13528]
	mov qword ptr [rsp + 1656], r10
	mov r10, qword ptr [rbp + 13592]
	mov qword ptr [rsp + 1664], r10
	mov r10, qword ptr [rbp + 13672]
	mov qword ptr [rsp + 1672], r10
	mov r10, qword ptr [rbp + 13736]
	mov qword ptr [rsp + 1680], r10
	mov r10, qword ptr [rbp + 13824]
	mov qword ptr [rsp + 1688], r10
	mov r10, qword ptr [rbp + 13904]
	mov qword ptr [rsp + 1696], r10
	mov r10, qword ptr [rbp + 13992]
	mov qword ptr [rsp + 1704], r10
	mov r10, qword ptr [rbp + 14064]
	mov qword ptr [rsp + 1712], r10
	mov r10, qword ptr [rbp + 14144]
	mov qword ptr [rsp + 1720], r10
	mov r10, qword ptr [rbp + 14216]
	mov qword ptr [rsp + 1728], r10
	mov r10, qword ptr [rbp + 14320]
	mov qword ptr [rsp + 1736], r10
	mov r10, qword ptr [rbp + 14416]
	mov qword ptr [rsp + 1744], r10
	mov r10, qword ptr [rbp + 14496]
	mov qword ptr [rsp + 1752], r10
	mov r10, qword ptr [rbp + 14576]
	mov qword ptr [rsp + 1760], r10
	mov r10, qword ptr [rbp + 14648]
	mov qword ptr [rsp + 1768], r10
	mov r10, qword ptr [rbp + 14712]
	mov qword ptr [rsp + 1776], r10
	mov r10, qword ptr [rbp + 14792]
	mov qword ptr [rsp + 1784], r10
	mov r10, qword ptr [rbp + 14864]
	mov qword ptr [rsp + 1792], r10
	mov r10, qword ptr [rbp + 14952]
	mov qword ptr [rsp + 1800], r10
	mov r10, qword ptr [rbp + 15024]
	mov qword ptr [rsp + 1808], r10
	mov r10, qword ptr [rbp + 15080]
	mov qword ptr [rsp + 1816], r10
	mov r10, qword ptr [rbp + 15144]
	mov qword ptr [rsp + 1824], r10
	mov r10, qword ptr [rbp + 15208]
	mov qword ptr [rsp + 1832], r10
	mov r10, qword ptr [rbp + 15280]
	mov qword ptr [rsp + 1840], r10
	mov r10, qword ptr [rbp + 15352]
	mov qword ptr [rsp + 1848], r10
	mov r10, qword ptr [rbp + 15416]
	mov qword ptr [rsp + 1856], r10
	mov r10, qword ptr [rbp + 15488]
	mov qword ptr [rsp + 1864], r10
	mov r10, qword ptr [rbp + 15552]
	mov qword ptr [rsp + 1872], r10
	mov r10, qword ptr [rbp + 15608]
	mov qword ptr [rsp + 1880], r10
	mov r10, qword ptr [rbp + 15680]
	mov qword ptr [rsp + 1888], r10
	mov r10, qword ptr [rbp + 15752]
	mov qword ptr [rsp + 1896], r10
	mov r10, qword ptr [rbp + 15808]
	mov qword ptr [rsp + 1904], r10
	mov r10, qword ptr [rbp + 15880]
	mov qword ptr [rsp + 1912], r10
	mov r10, qword ptr [rbp + 15952]
	mov qword ptr [rsp + 1920], r10
	mov r10, qword ptr [rbp + 16016]
	mov qword ptr [rsp + 1928], r10
	mov r10, qword ptr [rbp + 16088]
	mov qword ptr [rsp + 1936], r10
	mov r10, qword ptr [rbp + 16144]
	mov qword ptr [rsp + 1944], r10
	mov r10, qword ptr [rbp + 16200]
	mov qword ptr [rsp + 1952], r10
	mov r10, qword ptr [rbp + 16256]
	mov qword ptr [rsp + 1960], r10
	mov r10, qword ptr [rbp + 16312]
	mov qword ptr [rsp + 1968], r10
	mov r10, qword ptr [rbp + 16368]
	mov qword ptr [rsp + 1976], r10
	mov r10, qword ptr [rbp + 16424]
	mov qword ptr [rsp + 1984], r10
	mov r10, qword ptr [rbp + 16480]
	mov qword ptr [rsp + 1992], r10
	mov r10, qword ptr [rbp + 16536]
	mov qword ptr [rsp + 2000], r10
	mov r10, qword ptr [rbp + 16576]
	mov qword ptr [rsp + 2008], r10
	mov r10, qword ptr [rbp + 16624]
	mov qword ptr [rsp + 2016], r10
	mov r10, qword ptr [rbp + 16672]
	mov qword ptr [rsp + 2024], r10
	mov r10, qword ptr [rbp + 16712]
	mov qword ptr [rsp + 2032], r10
	mov r10, qword ptr [rbp + 16752]
	mov qword ptr [rsp + 2040], r10
	mov r10, qword ptr [rbp + 16784]
	mov qword ptr [rsp + 2048], r10
	mov r10, qword ptr [rbp + 16808]
	mov qword ptr [rsp + 2056], r10
	mov rbp, rsp
	mov rax, 0
	mov r12, rax
	mov rax, 1
	mov r13, rax
	mov rax, 2
	mov r14, rax
	mov rax, 3
	mov r15, rax
	mov rax, 4
	mov qword ptr [rbp - 2040], rax
	mov rax, 5
	mov qword ptr [rbp - 1992], rax
	mov rax, 6
	mov qword ptr [rbp - 1928], rax
	mov rax, 7
	mov qword ptr [rbp - 1864], rax
	mov rax, 8
	mov qword ptr [rbp - 1792], rax
	mov rax, 9
	mov qword ptr [rbp - 1744], rax
	mov rax, 10
	mov qword ptr [rbp - 1704], rax
	mov rax, 11
	mov qword ptr [rbp - 1624], rax
	mov rax, 12
	mov qword ptr [rbp - 1576], rax
	mov rax, 13
	mov qword ptr [rbp - 1512], rax
	mov rax, 14
	mov qword ptr [rbp - 1440], rax
	mov rax, 15
	mov qword ptr [rbp - 1384], rax
	mov rax, 16
	mov qword ptr [rbp - 1328], rax
	mov rax, 17
	mov qword ptr [rbp - 1248], rax
	mov rax, 18
	mov qword ptr [rbp - 1168], rax
	mov rax, 19
	mov qword ptr [rbp - 1104], rax
	mov rax, 20
	mov qword ptr [rbp - 1056], rax
	mov rax, 21
	mov qword ptr [rbp - 992], rax
	mov rax, 22
	mov qword ptr [rbp - 936], rax
	mov rax, 23
	mov qword ptr [rbp - 880], rax
	mov rax, 24
	mov qword ptr [rbp - 816], rax
	mov rax, 25
	mov qword ptr [rbp - 744], rax
	mov rax, 26
	mov qword ptr [rbp - 680], rax
	mov rax, 27
	mov qword ptr [rbp - 608], rax
	mov rax, 28
	mov qword ptr [rbp - 552], rax
	mov rax, 29
	mov qword ptr [rbp - 488], rax
	mov rax, 30
	mov qword ptr [rbp - 400], rax
	mov rax, 31
	mov qword ptr [rbp - 336], rax
	mov rax, 32
	mov qword ptr [rbp - 272], rax
	mov rax, 33
	mov qword ptr [rbp - 192], rax
	mov rax, 34
	mov qword ptr [rbp - 48], rax
	mov rax, 35
	mov qword ptr [rbp + 48], rax
	mov rax, 36
	mov qword ptr [rbp + 120], rax
	mov rax, 37
	mov qword ptr [rbp + 200], rax
	mov rax, 38
	mov qword ptr [rbp + 296], rax
	mov rax, 39
	mov qword ptr [rbp + 352], rax
	mov rax, 40
	mov qword ptr [rbp + 416], rax
	mov rax, 41
	mov qword ptr [rbp + 480], rax
	mov rax, 42
	mov qword ptr [rbp + 528], rax
	mov rax, 43
	mov qword ptr [rbp + 600], rax
	mov rax, 44
	mov qword ptr [rbp + 696], rax
	mov rax, 45
	mov qword ptr [rbp + 760], rax
	mov rax, 46
	mov qword ptr [rbp + 840], rax
	mov rax, 47
	mov qword ptr [rbp + 912], rax
	mov rax, 48
	mov qword ptr [rbp + 984], rax
	mov rax, 49
	mov qword ptr [rbp + 1056], rax
	mov rax, 50
	mov qword ptr [rbp + 1112], rax
	mov rax, 51
	mov qword ptr [rbp + 1176], rax
	mov rax, 52
	mov qword ptr [rbp + 1224], rax
	mov rax, 53
	mov qword ptr [rbp + 1272], rax
	mov rax, 54
	mov qword ptr [rbp + 1296], rax
	mov rax, 55
	mov qword ptr [rbp + 1312], rax
	mov rax, 56
	mov qword ptr [rbp + 1320], rax
	mov rax, 57
	mov qword ptr [rbp + 1480], rax
	mov rax, 58
	mov qword ptr [rbp + 1512], rax
	mov rax, 59
	mov qword ptr [rbp + 1544], rax
	mov rax, 60
	mov qword ptr [rbp + 1600], rax
	mov rax, 61
	mov qword ptr [rbp + 1664], rax
	mov rax, 62
	mov qword ptr [rbp + 1744], rax
	mov rax, 63
	mov qword ptr [rbp + 1808], rax
	mov rax, 64
	mov qword ptr [rbp + 1856], rax
	mov rax, 65
	mov qword ptr [rbp + 1920], rax
	mov rax, 66
	mov qword ptr [rbp + 1976], rax
	mov rax, 67
	mov qword ptr [rbp + 2064], rax
	mov rax, 68
	mov qword ptr [rbp + 2120], rax
	mov rax, 69
	mov qword ptr [rbp + 2176], rax
	mov rax, 70
	mov qword ptr [rbp + 2264], rax
	mov rax, 71
	mov qword ptr [rbp + 2352], rax
	mov rax, 72
	mov qword ptr [rbp + 2432], rax
	mov rax, 73
	mov qword ptr [rbp + 2512], rax
	mov rax, 74
	mov qword ptr [rbp + 2568], rax
	mov rax, 75
	mov qword ptr [rbp + 2640], rax
	mov rax, 76
	mov qword ptr [rbp + 2712], rax
	mov rax, 77
	mov qword ptr [rbp + 2784], rax
	mov rax, 78
	mov qword ptr [rbp + 2864], rax
	mov rax, 79
	mov qword ptr [rbp + 2920], rax
	mov rax, 80
	mov qword ptr [rbp + 2984], rax
	mov rax, 81
	mov qword ptr [rbp + 3072], rax
	mov rax, 82
	mov qword ptr [rbp + 3152], rax
	mov rax, 83
	mov qword ptr [rbp + 3232], rax
	mov rax, 84
	mov qword ptr [rbp + 3312], rax
	mov rax, 85
	mov qword ptr [rbp + 3408], rax
	mov rax, 86
	mov qword ptr [rbp + 3512], rax
	mov rax, 87
	mov qword ptr [rbp + 3584], rax
	mov rax, 88
	mov qword ptr [rbp + 3648], rax
	mov rax, 89
	mov qword ptr [rbp + 3744], rax
	mov rax, 90
	mov qword ptr [rbp + 3816], rax
	mov rax, 91
	mov qword ptr [rbp + 3896], rax
	mov rax, 92
	mov qword ptr [rbp + 3976], rax
	mov rax, 93
	mov qword ptr [rbp + 4088], rax
	mov rax, 94
	mov qword ptr [rbp + 4120], rax
	mov rax, 95
	mov qword ptr [rbp + 4200], rax
	mov rax, 96
	mov qword ptr [rbp + 4296], rax
	mov rax, 97
	mov qword ptr [rbp + 4408], rax
	mov rax, 98
	mov qword ptr [rbp + 4472], rax
	mov rax, 99
	mov qword ptr [rbp + 4544], rax
	mov rax, 100
	mov qword ptr [rbp + 4616], rax
	mov rax, 101
	mov qword ptr [rbp + 4712], rax
	mov rax, 102
	mov qword ptr [rbp + 4800], rax
	mov rax, 103
	mov qword ptr [rbp + 4904], rax
	mov rax, 104
	mov qword ptr [rbp + 4976], rax
	mov rax, 105
	mov qword ptr [rbp + 5072], rax
	mov rax, 106
	mov qword ptr [rbp + 5152], rax
	mov rax, 107
	mov qword ptr [rbp + 5232], rax
	mov rax, 108
	mov qword ptr [rbp + 5344], rax
	mov rax, 109
	mov qword ptr [rbp + 5440], rax
	mov rax, 110
	mov qword ptr [rbp + 5536], rax
	mov rax, 111
	mov qword ptr [rbp + 5616], rax
	mov rax, 112
	mov qword ptr [rbp + 5712], rax
	mov rax, 113
	mov qword ptr [rbp + 5784], rax
	mov rax, 114
	mov qword ptr [rbp + 5864], rax
	mov rax, 115
	mov qword ptr [rbp + 5960], rax
	mov rax, 116
	mov qword ptr [rbp + 6040], rax
	mov rax, 117
	mov qword ptr [rbp + 6128], rax
	mov rax, 118
	mov qword ptr [rbp + 6216], rax
	mov rax, 119
	mov qword ptr [rbp + 6280], rax
	mov rax, 120
	mov qword ptr [rbp + 6360], rax
	mov rax, 121
	mov qword ptr [rbp + 6464], rax
	mov rax, 122
	mov qword ptr [rbp + 6536], rax
	mov rax, 123
	mov qword ptr [rbp + 6624], rax
	mov rax, 124
	mov qword ptr [rbp + 6704], rax
	mov rax, 125
	mov qword ptr [rbp + 6800], rax
	mov rax, 126
	mov qword ptr [rbp + 6880], rax
	mov rax, 127
	mov qword ptr [rbp + 6968], rax
	mov rax, 128
	mov qword ptr [rbp + 7048], rax
	mov rax, 129
	mov qword ptr [rbp + 7136], rax
	mov rax, 130
	mov qword ptr [rbp + 7224], rax
	mov rax, 131
	mov qword ptr [rbp + 7312], rax
	mov rax, 132
	mov qword ptr [rbp + 7376], rax
	mov rax, 133
	mov qword ptr [rbp + 7456], rax
	mov rax, 134
	mov qword ptr [rbp + 7568], rax
	mov rax, 135
	mov qword ptr [rbp + 7656], rax
	mov rax, 136
	mov qword ptr [rbp + 7736], rax
	mov rax, 137
	mov qword ptr [rbp + 7824], rax
	mov rax, 138
	mov qword ptr [rbp + 7888], rax
	mov rax, 139
	mov qword ptr [rbp + 8088], rax
	mov rax, 140
	mov qword ptr [rbp + 8184], rax
	mov rax, 141
	mov qword ptr [rbp + 8272], rax
	mov rax, 142
	mov qword ptr [rbp + 8360], rax
	mov rax, 143
	mov qword ptr [rbp + 8448], rax
	mov rax, 144
	mov qword ptr [rbp + 8528], rax
	mov rax, 145
	mov qword ptr [rbp + 8624], rax
	mov rax, 146
	mov qword ptr [rbp + 8696], rax
	mov rax, 147
	mov qword ptr [rbp + 8784], rax
	mov rax, 148
	mov qword ptr [rbp + 8864], rax
	mov rax, 149
	mov qword ptr [rbp + 8992], rax
	mov rax, 150
	mov qword ptr [rbp + 9072], rax
	mov rax, 151
	mov qword ptr [rbp + 9160], rax
	mov rax, 152
	mov qword ptr [rbp + 9248], rax
	mov rax, 153
	mov qword ptr [rbp + 9328], rax
	mov rax, 154
	mov qword ptr [rbp + 9408], rax
	mov rax, 155
	mov qword ptr [rbp + 9488], rax
	mov rax, 156
	mov qword ptr [rbp + 9584], rax
	mov rax, 157
	mov qword ptr [rbp + 9672], rax
	mov rax, 158
	mov qword ptr [rbp + 9752], rax
	mov rax, 159
	mov qword ptr [rbp + 9832], rax
	mov rax, 160
	mov qword ptr [rbp + 9904], rax
	mov rax, 161
	mov qword ptr [rbp + 9984], rax
	mov rax, 162
	mov qword ptr [rbp + 10064], rax
	mov rax, 163
	mov qword ptr [rbp + 10152], rax
	mov rax, 164
	mov qword ptr [rbp + 10240], rax
	mov rax, 165
	mov qword ptr [rbp + 10312], rax
	mov rax, 166
	mov qword ptr [rbp + 10448], rax
	mov rax, 167
	mov qword ptr [rbp + 10544], rax
	mov rax, 168
	mov qword ptr [rbp + 10584], rax
	mov rax, 169
	mov qword ptr [rbp + 10656], rax
	mov rax, 170
	mov qword ptr [rbp + 10720], rax
	mov rax, 171
	mov qword ptr [rbp + 10776], rax
	mov rax, 172
	mov qword ptr [rbp + 10832], rax
	mov rax, 173
	mov qword ptr [rbp + 10888], rax
	mov rax, 174
	mov qword ptr [rbp + 10960], rax
	mov rax, 175
	mov qword ptr [rbp + 11016], rax
	mov rax, 176
	mov qword ptr [rbp + 11064], rax
	mov rax, 177
	mov qword ptr [rbp + 11136], rax
	mov rax, 178
	mov qword ptr [rbp + 11200], rax
	mov rax, 179
	mov qword ptr [rbp + 11256], rax
	mov rax, 180
	mov qword ptr [rbp + 11312], rax
	mov rax, 181
	mov qword ptr [rbp + 11360], rax
	mov rax, 182
	mov qword ptr [rbp + 11512], rax
	mov rax, 183
	mov qword ptr [rbp + 11600], rax
	mov rax, 184
	mov qword ptr [rbp + 11688], rax
	mov rax, 185
	mov qword ptr [rbp + 11776], rax
	mov rax, 186
	mov qword ptr [rbp + 11872], rax
	mov rax, 187
	mov qword ptr [rbp + 11928], rax
	mov rax, 188
	mov qword ptr [rbp + 12016], rax
	mov rax, 189
	mov qword ptr [rbp + 12136], rax
	mov rax, 190
	mov qword ptr [rbp + 12224], rax
	mov rax, 191
	mov qword ptr [rbp + 12288], rax
	mov rax, 192
	mov qword ptr [rbp + 12360], rax
	mov rax, 193
	mov qword ptr [rbp + 12448], rax
	mov rax, 194
	mov qword ptr [rbp + 12552], rax
	mov rax, 195
	mov qword ptr [rbp + 12640], rax
	mov rax, 196
	mov qword ptr [rbp + 12728], rax
	mov rax, 197
	mov qword ptr [rbp + 12808], rax
	mov rax, 198
	mov qword ptr [rbp + 12912], rax
	mov rax, 199
	mov qword ptr [rbp + 12984], rax
	mov rax, 200
	mov qword ptr [rbp + 13064], rax
	mov rax, 201
	mov qword ptr [rbp + 13144], rax
	mov rax, 202
	mov qword ptr [rbp + 13224], rax
	mov rax, 203
	mov qword ptr [rbp + 13296], rax
	mov rax, 204
	mov qword ptr [rbp + 13376], rax
	mov rax, 205
	mov qword ptr [rbp + 13456], rax
	mov rax, 206
	mov qword ptr [rbp + 13528], rax
	mov rax, 207
	mov qword ptr [rbp + 13592], rax
	mov rax, 208
	mov qword ptr [rbp + 13672], rax
	mov rax, 209
	mov qword ptr [rbp + 13736], rax
	mov rax, 210
	mov qword ptr [rbp + 13824], rax
	mov rax, 211
	mov qword ptr [rbp + 13904], rax
	mov rax, 212
	mov qword ptr [rbp + 13992], rax
	mov rax, 213
	mov qword ptr [rbp + 14064], rax
	mov rax, 214
	mov qword ptr [rbp + 14144], rax
	mov rax, 215
	mov qword ptr [rbp + 14216], rax
	mov rax, 216
	mov qword ptr [rbp + 14320], rax
	mov rax, 217
	mov qword ptr [rbp + 14416], rax
	mov rax, 218
	mov qword ptr [rbp + 14496], rax
	mov rax, 219
	mov qword ptr [rbp + 14576], rax
	mov rax, 220
	mov qword ptr [rbp + 14648], rax
	mov rax, 221
	mov qword ptr [rbp + 14712], rax
	mov rax, 222
	mov qword ptr [rbp + 14792], rax
	mov rax, 223
	mov qword ptr [rbp + 14864], rax
	mov rax, 224
	mov qword ptr [rbp + 14952], rax
	mov rax, 225
	mov qword ptr [rbp + 15024], rax
	mov rax, 226
	mov qword ptr [rbp + 15080], rax
	mov rax, 227
	mov qword ptr [rbp + 15144], rax
	mov rax, 228
	mov qword ptr [rbp + 15208], rax
	mov rax, 229
	mov qword ptr [rbp + 15280], rax
	mov rax, 230
	mov qword ptr [rbp + 15352], rax
	mov rax, 231
	mov qword ptr [rbp + 15416], rax
	mov rax, 232
	mov qword ptr [rbp + 15488], rax
	mov rax, 233
	mov qword ptr [rbp + 15552], rax
	mov rax, 234
	mov qword ptr [rbp + 15608], rax
	mov rax, 235
	mov qword ptr [rbp + 15680], rax
	mov rax, 236
	mov qword ptr [rbp + 15752], rax
	mov rax, 237
	mov qword ptr [rbp + 15808], rax
	mov rax, 238
	mov qword ptr [rbp + 15880], rax
	mov rax, 239
	mov qword ptr [rbp + 15952], rax
	mov rax, 240
	mov qword ptr [rbp + 16016], rax
	mov rax, 241
	mov qword ptr [rbp + 16088], rax
	mov rax, 242
	mov qword ptr [rbp + 16144], rax
	mov rax, 243
	mov qword ptr [rbp + 16200], rax
	mov rax, 244
	mov qword ptr [rbp + 16256], rax
	mov rax, 245
	mov qword ptr [rbp + 16312], rax
	mov rax, 246
	mov qword ptr [rbp + 16368], rax
	mov rax, 247
	mov qword ptr [rbp + 16424], rax
	mov rax, 248
	mov qword ptr [rbp + 16480], rax
	mov rax, 249
	mov qword ptr [rbp + 16536], rax
	mov rax, 250
	mov qword ptr [rbp + 16576], rax
	mov rax, 251
	mov qword ptr [rbp + 16624], rax
	mov rax, 252
	mov qword ptr [rbp + 16672], rax
	mov rax, 253
	mov qword ptr [rbp + 16712], rax
	mov rax, 254
	mov qword ptr [rbp + 16752], rax
	mov rax, 255
	mov qword ptr [rbp + 16784], rax
	mov rax, 256
	mov qword ptr [rbp + 16808], rax
	mov rax, 0
	mov rbx, qword ptr [rsp]
	mov r12, qword ptr [rsp + 8]
	mov r13, qword ptr [rsp + 16]
	mov r14, qword ptr [rsp + 24]
	mov r15, qword ptr [rsp + 32]
	mov r10, qword ptr [rsp + 40]
	mov qword ptr [rbp - 2040], r10
	mov r10, qword ptr [rsp + 48]
	mov qword ptr [rbp - 1992], r10
	mov r10, qword ptr [rsp + 56]
	mov qword ptr [rbp - 1928], r10
	mov r10, qword ptr [rsp + 64]
	mov qword ptr [rbp - 1864], r10
	mov r10, qword ptr [rsp + 72]
	mov qword ptr [rbp - 1792], r10
	mov r10, qword ptr [rsp + 80]
	mov qword ptr [rbp - 1744], r10
	mov r10, qword ptr [rsp + 88]
	mov qword ptr [rbp - 1704], r10
	mov r10, qword ptr [rsp + 96]
	mov qword ptr [rbp - 1624], r10
	mov r10, qword ptr [rsp + 104]
	mov qword ptr [rbp - 1576], r10
	mov r10, qword ptr [rsp + 112]
	mov qword ptr [rbp - 1512], r10
	mov r10, qword ptr [rsp + 120]
	mov qword ptr [rbp - 1440], r10
	mov r10, qword ptr [rsp + 128]
	mov qword ptr [rbp - 1384], r10
	mov r10, qword ptr [rsp + 136]
	mov qword ptr [rbp - 1328], r10
	mov r10, qword ptr [rsp + 144]
	mov qword ptr [rbp - 1248], r10
	mov r10, qword ptr [rsp + 152]
	mov qword ptr [rbp - 1168], r10
	mov r10, qword ptr [rsp + 160]
	mov qword ptr [rbp - 1104], r10
	mov r10, qword ptr [rsp + 168]
	mov qword ptr [rbp - 1056], r10
	mov r10, qword ptr [rsp + 176]
	mov qword ptr [rbp - 992], r10
	mov r10, qword ptr [rsp + 184]
	mov qword ptr [rbp - 936], r10
	mov r10, qword ptr [rsp + 192]
	mov qword ptr [rbp - 880], r10
	mov r10, qword ptr [rsp + 200]
	mov qword ptr [rbp - 816], r10
	mov r10, qword ptr [rsp + 208]
	mov qword ptr [rbp - 744], r10
	mov r10, qword ptr [rsp + 216]
	mov qword ptr [rbp - 680], r10
	mov r10, qword ptr [rsp + 224]
	mov qword ptr [rbp - 608], r10
	mov r10, qword ptr [rsp + 232]
	mov qword ptr [rbp - 552], r10
	mov r10, qword ptr [rsp + 240]
	mov qword ptr [rbp - 488], r10
	mov r10, qword ptr [rsp + 248]
	mov qword ptr [rbp - 400], r10
	mov r10, qword ptr [rsp + 256]
	mov qword ptr [rbp - 336], r10
	mov r10, qword ptr [rsp + 264]
	mov qword ptr [rbp - 272], r10
	mov r10, qword ptr [rsp + 272]
	mov qword ptr [rbp - 192], r10
	mov r10, qword ptr [rsp + 280]
	mov qword ptr [rbp - 48], r10
	mov r10, qword ptr [rsp + 288]
	mov qword ptr [rbp + 48], r10
	mov r10, qword ptr [rsp + 296]
	mov qword ptr [rbp + 120], r10
	mov r10, qword ptr [rsp + 304]
	mov qword ptr [rbp + 200], r10
	mov r10, qword ptr [rsp + 312]
	mov qword ptr [rbp + 296], r10
	mov r10, qword ptr [rsp + 320]
	mov qword ptr [rbp + 352], r10
	mov r10, qword ptr [rsp + 328]
	mov qword ptr [rbp + 416], r10
	mov r10, qword ptr [rsp + 336]
	mov qword ptr [rbp + 480], r10
	mov r10, qword ptr [rsp + 344]
	mov qword ptr [rbp + 528], r10
	mov r10, qword ptr [rsp + 352]
	mov qword ptr [rbp + 600], r10
	mov r10, qword ptr [rsp + 360]
	mov qword ptr [rbp + 696], r10
	mov r10, qword ptr [rsp + 368]
	mov qword ptr [rbp + 760], r10
	mov r10, qword ptr [rsp + 376]
	mov qword ptr [rbp + 840], r10
	mov r10, qword ptr [rsp + 384]
	mov qword ptr [rbp + 912], r10
	mov r10, qword ptr [rsp + 392]
	mov qword ptr [rbp + 984], r10
	mov r10, qword ptr [rsp + 400]
	mov qword ptr [rbp + 1056], r10
	mov r10, qword ptr [rsp + 408]
	mov qword ptr [rbp + 1112], r10
	mov r10, qword ptr [rsp + 416]
	mov qword ptr [rbp + 1176], r10
	mov r10, qword ptr [rsp + 424]
	mov qword ptr [rbp + 1224], r10
	mov r10, qword ptr [rsp + 432]
	mov qword ptr [rbp + 1272], r10
	mov r10, qword ptr [rsp + 440]
	mov qword ptr [rbp + 1296], r10
	mov r10, qword ptr [rsp + 448]
	mov qword ptr [rbp + 1312], r10
	mov r10, qword ptr [rsp + 456]
	mov qword ptr [rbp + 1320], r10
	mov r10, qword ptr [rsp + 464]
	mov qword ptr [rbp + 1480], r10
	mov r10, qword ptr [rsp + 472]
	mov qword ptr [rbp + 1512], r10
	mov r10, qword ptr [rsp + 480]
	mov qword ptr [rbp + 1544], r10
	mov r10, qword ptr [rsp + 488]
	mov qword ptr [rbp + 1600], r10
	mov r10, qword ptr [rsp + 496]
	mov qword ptr [rbp + 1664], r10
	mov r10, qword ptr [rsp + 504]
	mov qword ptr [rbp + 1744], r10
	mov r10, qword ptr [rsp + 512]
	mov qword ptr [rbp + 1808], r10
	mov r10, qword ptr [rsp + 520]
	mov qword ptr [rbp + 1856], r10
	mov r10, qword ptr [rsp + 528]
	mov qword ptr [rbp + 1920], r10
	mov r10, qword ptr [rsp + 536]
	mov qword ptr [rbp + 1976], r10
	mov r10, qword ptr [rsp + 544]
	mov qword ptr [rbp + 2064], r10
	mov r10, qword ptr [rsp + 552]
	mov qword ptr [rbp + 2120], r10
	mov r10, qword ptr [rsp + 560]
	mov qword ptr [rbp + 2176], r10
	mov r10, qword ptr [rsp + 568]
	mov qword ptr [rbp + 2264], r10
	mov r10, qword ptr [rsp + 576]
	mov qword ptr [rbp + 2352], r10
	mov r10, qword ptr [rsp + 584]
	mov qword ptr [rbp + 2432], r10
	mov r10, qword ptr [rsp + 592]
	mov qword ptr [rbp + 2512], r10
	mov r10, qword ptr [rsp + 600]
	mov qword ptr [rbp + 2568], r10
	mov r10, qword ptr [rsp + 608]
	mov qword ptr [rbp + 2640], r10
	mov r10, qword ptr [rsp + 616]
	mov qword ptr [rbp + 2712], r10
	mov r10, qword ptr [rsp + 624]
	mov qword ptr [rbp + 2784], r10
	mov r10, qword ptr [rsp + 632]
	mov qword ptr [rbp + 2864], r10
	mov r10, qword ptr [rsp + 640]
	mov qword ptr [rbp + 2920], r10
	mov r10, qword ptr [rsp + 648]
	mov qword ptr [rbp + 2984], r10
	mov r10, qword ptr [rsp + 656]
	mov qword ptr [rbp + 3072], r10
	mov r10, qword ptr [rsp + 664]
	mov qword ptr [rbp + 3152], r10
	mov r10, qword ptr [rsp + 672]
	mov qword ptr [rbp + 3232], r10
	mov r10, qword ptr [rsp + 680]
	mov qword ptr [rbp + 3312], r10
	mov r10, qword ptr [rsp + 688]
	mov qword ptr [rbp + 3408], r10
	mov r10, qword ptr [rsp + 696]
	mov qword ptr [rbp + 3512], r10
	mov r10, qword ptr [rsp + 704]
	mov qword ptr [rbp + 3584], r10
	mov r10, qword ptr [rsp + 712]
	mov qword ptr [rbp + 3648], r10
	mov r10, qword ptr [rsp + 720]
	mov qword ptr [rbp + 3744], r10
	mov r10, qword ptr [rsp + 728]
	mov qword ptr [rbp + 3816], r10
	mov r10, qword ptr [rsp + 736]
	mov qword ptr [rbp + 3896], r10
	mov r10, qword ptr [rsp + 744]
	mov qword ptr [rbp + 3976], r10
	mov r10, qword ptr [rsp + 752]
	mov qword ptr [rbp + 4088], r10
	mov r10, qword ptr [rsp + 760]
	mov qword ptr [rbp + 4120], r10
	mov r10, qword ptr [rsp + 768]
	mov qword ptr [rbp + 4200], r10
	mov r10, qword ptr [rsp + 776]
	mov qword ptr [rbp + 4296], r10
	mov r10, qword ptr [rsp + 784]
	mov qword ptr [rbp + 4408], r10
	mov r10, qword ptr [rsp + 792]
	mov qword ptr [rbp + 4472], r10
	mov r10, qword ptr [rsp + 800]
	mov qword ptr [rbp + 4544], r10
	mov r10, qword ptr [rsp + 808]
	mov qword ptr [rbp + 4616], r10
	mov r10, qword ptr [rsp + 816]
	mov qword ptr [rbp + 4712], r10
	mov r10, qword ptr [rsp + 824]
	mov qword ptr [rbp + 4800], r10
	mov r10, qword ptr [rsp + 832]
	mov qword ptr [rbp + 4904], r10
	mov r10, qword ptr [rsp + 840]
	mov qword ptr [rbp + 4976], r10
	mov r10, qword ptr [rsp + 848]
	mov qword ptr [rbp + 5072], r10
	mov r10, qword ptr [rsp + 856]
	mov qword ptr [rbp + 5152], r10
	mov r10, qword ptr [rsp + 864]
	mov qword ptr [rbp + 5232], r10
	mov r10, qword ptr [rsp + 872]
	mov qword ptr [rbp + 5344], r10
	mov r10, qword ptr [rsp + 880]
	mov qword ptr [rbp + 5440], r10
	mov r10, qword ptr [rsp + 888]
	mov qword ptr [rbp + 5536], r10
	mov r10, qword ptr [rsp + 896]
	mov qword ptr [rbp + 5616], r10
	mov r10, qword ptr [rsp + 904]
	mov qword ptr [rbp + 5712], r10
	mov r10, qword ptr [rsp + 912]
	mov qword ptr [rbp + 5784], r10
	mov r10, qword ptr [rsp + 920]
	mov qword ptr [rbp + 5864], r10
	mov r10, qword ptr [rsp + 928]
	mov qword ptr [rbp + 5960], r10
	mov r10, qword ptr [rsp + 936]
	mov qword ptr [rbp + 6040], r10
	mov r10, qword ptr [rsp + 944]
	mov qword ptr [rbp + 6128], r10
	mov r10, qword ptr [rsp + 952]
	mov qword ptr [rbp + 6216], r10
	mov r10, qword ptr [rsp + 960]
	mov qword ptr [rbp + 6280], r10
	mov r10, qword ptr [rsp + 968]
	mov qword ptr [rbp + 6360], r10
	mov r10, qword ptr [rsp + 976]
	mov qword ptr [rbp + 6464], r10
	mov r10, qword ptr [rsp + 984]
	mov qword ptr [rbp + 6536], r10
	mov r10, qword ptr [rsp + 992]
	mov qword ptr [rbp + 6624], r10
	mov r10, qword ptr [rsp + 1000]
	mov qword ptr [rbp + 6704], r10
	mov r10, qword ptr [rsp + 1008]
	mov qword ptr [rbp + 6800], r10
	mov r10, qword ptr [rsp + 1016]
	mov qword ptr [rbp + 6880], r10
	mov r10, qword ptr [rsp + 1024]
	mov qword ptr [rbp + 6968], r10
	mov r10, qword ptr [rsp + 1032]
	mov qword ptr [rbp + 7048], r10
	mov r10, qword ptr [rsp + 1040]
	mov qword ptr [rbp + 7136], r10
	mov r10, qword ptr [rsp + 1048]
	mov qword ptr [rbp + 7224], r10
	mov r10, qword ptr [rsp + 1056]
	mov qword ptr [rbp + 7312], r10
	mov r10, qword ptr [rsp + 1064]
	mov qword ptr [rbp + 7376], r10
	mov r10, qword ptr [rsp + 1072]
	mov qword ptr [rbp + 7456], r10
	mov r10, qword ptr [rsp + 1080]
	mov qword ptr [rbp + 7568], r10
	mov r10, qword ptr [rsp + 1088]
	mov qword ptr [rbp + 7656], r10
	mov r10, qword ptr [rsp + 1096]
	mov qword ptr [rbp + 7736], r10
	mov r10, qword ptr [rsp + 1104]
	mov qword ptr [rbp + 7824], r10
	mov r10, qword ptr [rsp + 1112]
	mov qword ptr [rbp + 7888], r10
	mov r10, qword ptr [rsp + 1120]
	mov qword ptr [rbp + 8088], r10
	mov r10, qword ptr [rsp + 1128]
	mov qword ptr [rbp + 8184], r10
	mov r10, qword ptr [rsp + 1136]
	mov qword ptr [rbp + 8272], r10
	mov r10, qword ptr [rsp + 1144]
	mov qword ptr [rbp + 8360], r10
	mov r10, qword ptr [rsp + 1152]
	mov qword ptr [rbp + 8448], r10
	mov r10, qword ptr [rsp + 1160]
	mov qword ptr [rbp + 8528], r10
	mov r10, qword ptr [rsp + 1168]
	mov qword ptr [rbp + 8624], r10
	mov r10, qword ptr [rsp + 1176]
	mov qword ptr [rbp + 8696], r10
	mov r10, qword ptr [rsp + 1184]
	mov qword ptr [rbp + 8784], r10
	mov r10, qword ptr [rsp + 1192]
	mov qword ptr [rbp + 8864], r10
	mov r10, qword ptr [rsp + 1200]
	mov qword ptr [rbp + 8992], r10
	mov r10, qword ptr [rsp + 1208]
	mov qword ptr [rbp + 9072], r10
	mov r10, qword ptr [rsp + 1216]
	mov qword ptr [rbp + 9160], r10
	mov r10, qword ptr [rsp + 1224]
	mov qword ptr [rbp + 9248], r10
	mov r10, qword ptr [rsp + 1232]
	mov qword ptr [rbp + 9328], r10
	mov r10, qword ptr [rsp + 1240]
	mov qword ptr [rbp + 9408], r10
	mov r10, qword ptr [rsp + 1248]
	mov qword ptr [rbp + 9488], r10
	mov r10, qword ptr [rsp + 1256]
	mov qword ptr [rbp + 9584], r10
	mov r10, qword ptr [rsp + 1264]
	mov qword ptr [rbp + 9672], r10
	mov r10, qword ptr [rsp + 1272]
	mov qword ptr [rbp + 9752], r10
	mov r10, qword ptr [rsp + 1280]
	mov qword ptr [rbp + 9832], r10
	mov r10, qword ptr [rsp + 1288]
	mov qword ptr [rbp + 9904], r10
	mov r10, qword ptr [rsp + 1296]
	mov qword ptr [rbp + 9984], r10
	mov r10, qword ptr [rsp + 1304]
	mov qword ptr [rbp + 10064], r10
	mov r10, qword ptr [rsp + 1312]
	mov qword ptr [rbp + 10152], r10
	mov r10, qword ptr [rsp + 1320]
	mov qword ptr [rbp + 10240], r10
	mov r10, qword ptr [rsp + 1328]
	mov qword ptr [rbp + 10312], r10
	mov r10, qword ptr [rsp + 1336]
	mov qword ptr [rbp + 10448], r10
	mov r10, qword ptr [rsp + 1344]
	mov qword ptr [rbp + 10544], r10
	mov r10, qword ptr [rsp + 1352]
	mov qword ptr [rbp + 10584], r10
	mov r10, qword ptr [rsp + 1360]
	mov qword ptr [rbp + 10656], r10
	mov r10, qword ptr [rsp + 1368]
	mov qword ptr [rbp + 10720], r10
	mov r10, qword ptr [rsp + 1376]
	mov qword ptr [rbp + 10776], r10
	mov r10, qword ptr [rsp + 1384]
	mov qword ptr [rbp + 10832], r10
	mov r10, qword ptr [rsp + 1392]
	mov qword ptr [rbp + 10888], r10
	mov r10, qword ptr [rsp + 1400]
	mov qword ptr [rbp + 10960], r10
	mov r10, qword ptr [rsp + 1408]
	mov qword ptr [rbp + 11016], r10
	mov r10, qword ptr [rsp + 1416]
	mov qword ptr [rbp + 11064], r10
	mov r10, qword ptr [rsp + 1424]
	mov qword ptr [rbp + 11136], r10
	mov r10, qword ptr [rsp + 1432]
	mov qword ptr [rbp + 11200], r10
	mov r10, qword ptr [rsp + 1440]
	mov qword ptr [rbp + 11256], r10
	mov r10, qword ptr [rsp + 1448]
	mov qword ptr [rbp + 11312], r10
	mov r10, qword ptr [rsp + 1456]
	mov qword ptr [rbp + 11360], r10
	mov r10, qword ptr [rsp + 1464]
	mov qword ptr [rbp + 11512], r10
	mov r10, qword ptr [rsp + 1472]
	mov qword ptr [rbp + 11600], r10
	mov r10, qword ptr [rsp + 1480]
	mov qword ptr [rbp + 11688], r10
	mov r10, qword ptr [rsp + 1488]
	mov qword ptr [rbp + 11776], r10
	mov r10, qword ptr [rsp + 1496]
	mov qword ptr [rbp + 11872], r10
	mov r10, qword ptr [rsp + 1504]
	mov qword ptr [rbp + 11928], r10
	mov r10, qword ptr [rsp + 1512]
	mov qword ptr [rbp + 12016], r10
	mov r10, qword ptr [rsp + 1520]
	mov qword ptr [rbp + 12136], r10
	mov r10, qword ptr [rsp + 1528]
	mov qword ptr [rbp + 12224], r10
	mov r10, qword ptr [rsp + 1536]
	mov qword ptr [rbp + 12288], r10
	mov r10, qword ptr [rsp + 1544]
	mov qword ptr [rbp + 12360], r10
	mov r10, qword ptr [rsp + 1552]
	mov qword ptr [rbp + 12448], r10
	mov r10, qword ptr [rsp + 1560]
	mov qword ptr [rbp + 12552], r10
	mov r10, qword ptr [rsp + 1568]
	mov qword ptr [rbp + 12640], r10
	mov r10, qword ptr [rsp + 1576]
	mov qword ptr [rbp + 12728], r10
	mov r10, qword ptr [rsp + 1584]
	mov qword ptr [rbp + 12808], r10
	mov r10, qword ptr [rsp + 1592]
	mov qword ptr [rbp + 12912], r10
	mov r10, qword ptr [rsp + 1600]
	mov qword ptr [rbp + 12984], r10
	mov r10, qword ptr [rsp + 1608]
	mov qword ptr [rbp + 13064], r10
	mov r10, qword ptr [rsp + 1616]
	mov qword ptr [rbp + 13144], r10
	mov r10, qword ptr [rsp + 1624]
	mov qword ptr [rbp + 13224], r10
	mov r10, qword ptr [rsp + 1632]
	mov qword ptr [rbp + 13296], r10
	mov r10, qword ptr [rsp + 1640]
	mov qword ptr [rbp + 13376], r10
	mov r10, qword ptr [rsp + 1648]
	mov qword ptr [rbp + 13456], r10
	mov r10, qword ptr [rsp + 1656]
	mov qword ptr [rbp + 13528], r10
	mov r10, qword ptr [rsp + 1664]
	mov qword ptr [rbp + 13592], r10
	mov r10, qword ptr [rsp + 1672]
	mov qword ptr [rbp + 13672], r10
	mov r10, qword ptr [rsp + 1680]
	mov qword ptr [rbp + 13736], r10
	mov r10, qword ptr [rsp + 1688]
	mov qword ptr [rbp + 13824], r10
	mov r10, qword ptr [rsp + 1696]
	mov qword ptr [rbp + 13904], r10
	mov r10, qword ptr [rsp + 1704]
	mov qword ptr [rbp + 13992], r10
	mov r10, qword ptr [rsp + 1712]
	mov qword ptr [rbp + 14064], r10
	mov r10, qword ptr [rsp + 1720]
	mov qword ptr [rbp + 14144], r10
	mov r10, qword ptr [rsp + 1728]
	mov qword ptr [rbp + 14216], r10
	mov r10, qword ptr [rsp + 1736]
	mov qword ptr [rbp + 14320], r10
	mov r10, qword ptr [rsp + 1744]
	mov qword ptr [rbp + 14416], r10
	mov r10, qword ptr [rsp + 1752]
	mov qword ptr [rbp + 14496], r10
	mov r10, qword ptr [rsp + 1760]
	mov qword ptr [rbp + 14576], r10
	mov r10, qword ptr [rsp + 1768]
	mov qword ptr [rbp + 14648], r10
	mov r10, qword ptr [rsp + 1776]
	mov qword ptr [rbp + 14712], r10
	mov r10, qword ptr [rsp + 1784]
	mov qword ptr [rbp + 14792], r10
	mov r10, qword ptr [rsp + 1792]
	mov qword ptr [rbp + 14864], r10
	mov r10, qword ptr [rsp + 1800]
	mov qword ptr [rbp + 14952], r10
	mov r10, qword ptr [rsp + 1808]
	mov qword ptr [rbp + 15024], r10
	mov r10, qword ptr [rsp + 1816]
	mov qword ptr [rbp + 15080], r10
	mov r10, qword ptr [rsp + 1824]
	mov qword ptr [rbp + 15144], r10
	mov r10, qword ptr [rsp + 1832]
	mov qword ptr [rbp + 15208], r10
	mov r10, qword ptr [rsp + 1840]
	mov qword ptr [rbp + 15280], r10
	mov r10, qword ptr [rsp + 1848]
	mov qword ptr [rbp + 15352], r10
	mov r10, qword ptr [rsp + 1856]
	mov qword ptr [rbp + 15416], r10
	mov r10, qword ptr [rsp + 1864]
	mov qword ptr [rbp + 15488], r10
	mov r10, qword ptr [rsp + 1872]
	mov qword ptr [rbp + 15552], r10
	mov r10, qword ptr [rsp + 1880]
	mov qword ptr [rbp + 15608], r10
	mov r10, qword ptr [rsp + 1888]
	mov qword ptr [rbp + 15680], r10
	mov r10, qword ptr [rsp + 1896]
	mov qword ptr [rbp + 15752], r10
	mov r10, qword ptr [rsp + 1904]
	mov qword ptr [rbp + 15808], r10
	mov r10, qword ptr [rsp + 1912]
	mov qword ptr [rbp + 15880], r10
	mov r10, qword ptr [rsp + 1920]
	mov qword ptr [rbp + 15952], r10
	mov r10, qword ptr [rsp + 1928]
	mov qword ptr [rbp + 16016], r10
	mov r10, qword ptr [rsp + 1936]
	mov qword ptr [rbp + 16088], r10
	mov r10, qword ptr [rsp + 1944]
	mov qword ptr [rbp + 16144], r10
	mov r10, qword ptr [rsp + 1952]
	mov qword ptr [rbp + 16200], r10
	mov r10, qword ptr [rsp + 1960]
	mov qword ptr [rbp + 16256], r10
	mov r10, qword ptr [rsp + 1968]
	mov qword ptr [rbp + 16312], r10
	mov r10, qword ptr [rsp + 1976]
	mov qword ptr [rbp + 16368], r10
	mov r10, qword ptr [rsp + 1984]
	mov qword ptr [rbp + 16424], r10
	mov r10, qword ptr [rsp + 1992]
	mov qword ptr [rbp + 16480], r10
	mov r10, qword ptr [rsp + 2000]
	mov qword ptr [rbp + 16536], r10
	mov r10, qword ptr [rsp + 2008]
	mov qword ptr [rbp + 16576], r10
	mov r10, qword ptr [rsp + 2016]
	mov qword ptr [rbp + 16624], r10
	mov r10, qword ptr [rsp + 2024]
	mov qword ptr [rbp + 16672], r10
	mov r10, qword ptr [rsp + 2032]
	mov qword ptr [rbp + 16712], r10
	mov r10, qword ptr [rsp + 2040]
	mov qword ptr [rbp + 16752], r10
	mov r10, qword ptr [rsp + 2048]
	mov qword ptr [rbp + 16784], r10
	mov r10, qword ptr [rsp + 2056]
	mov qword ptr [rbp + 16808], r10
	add rsp, 2064
	pop rbp
	ret
