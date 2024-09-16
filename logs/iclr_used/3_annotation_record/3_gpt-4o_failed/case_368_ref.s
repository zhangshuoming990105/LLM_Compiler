.globl DVBGenreCode
.type DVBGenreCode, @function
DVBGenreCode:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -20(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	movzbl	-20(%rbp), %eax
	cmpl	$179, %eax
	ja	.L2
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L4(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L4(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L83-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L82-.L4
	.long	.L81-.L4
	.long	.L80-.L4
	.long	.L79-.L4
	.long	.L78-.L4
	.long	.L77-.L4
	.long	.L76-.L4
	.long	.L75-.L4
	.long	.L74-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L73-.L4
	.long	.L72-.L4
	.long	.L71-.L4
	.long	.L70-.L4
	.long	.L69-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L68-.L4
	.long	.L67-.L4
	.long	.L66-.L4
	.long	.L65-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L64-.L4
	.long	.L63-.L4
	.long	.L62-.L4
	.long	.L61-.L4
	.long	.L60-.L4
	.long	.L59-.L4
	.long	.L58-.L4
	.long	.L57-.L4
	.long	.L56-.L4
	.long	.L55-.L4
	.long	.L54-.L4
	.long	.L53-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L52-.L4
	.long	.L51-.L4
	.long	.L50-.L4
	.long	.L49-.L4
	.long	.L48-.L4
	.long	.L47-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L46-.L4
	.long	.L45-.L4
	.long	.L44-.L4
	.long	.L43-.L4
	.long	.L42-.L4
	.long	.L41-.L4
	.long	.L40-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L39-.L4
	.long	.L38-.L4
	.long	.L37-.L4
	.long	.L36-.L4
	.long	.L35-.L4
	.long	.L34-.L4
	.long	.L33-.L4
	.long	.L32-.L4
	.long	.L31-.L4
	.long	.L30-.L4
	.long	.L29-.L4
	.long	.L28-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L27-.L4
	.long	.L26-.L4
	.long	.L25-.L4
	.long	.L24-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L23-.L4
	.long	.L22-.L4
	.long	.L21-.L4
	.long	.L20-.L4
	.long	.L19-.L4
	.long	.L18-.L4
	.long	.L17-.L4
	.long	.L16-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L15-.L4
	.long	.L14-.L4
	.long	.L13-.L4
	.long	.L12-.L4
	.long	.L11-.L4
	.long	.L10-.L4
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L7-.L4
	.long	.L6-.L4
	.long	.L5-.L4
	.long	.L3-.L4
	.text
.L83:
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L82:
	leaq	.LC1(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L81:
	leaq	.LC2(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L80:
	leaq	.LC3(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L79:
	leaq	.LC4(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L78:
	leaq	.LC5(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L77:
	leaq	.LC6(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L76:
	leaq	.LC7(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L75:
	leaq	.LC8(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L74:
	leaq	.LC9(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L73:
	leaq	.LC10(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L72:
	leaq	.LC11(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L71:
	leaq	.LC12(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L70:
	leaq	.LC12(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L69:
	leaq	.LC13(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L68:
	leaq	.LC14(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L67:
	leaq	.LC15(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L66:
	leaq	.LC16(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L65:
	leaq	.LC17(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L64:
	leaq	.LC18(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L63:
	leaq	.LC19(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L62:
	leaq	.LC20(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L61:
	leaq	.LC21(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L60:
	leaq	.LC22(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L59:
	leaq	.LC23(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L58:
	leaq	.LC24(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L57:
	leaq	.LC25(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L56:
	leaq	.LC26(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L55:
	leaq	.LC27(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L54:
	leaq	.LC28(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L53:
	leaq	.LC29(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L52:
	leaq	.LC30(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L51:
	leaq	.LC31(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L50:
	leaq	.LC32(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L49:
	leaq	.LC33(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L48:
	leaq	.LC34(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L47:
	leaq	.LC35(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L46:
	leaq	.LC36(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L45:
	leaq	.LC37(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L44:
	leaq	.LC38(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L43:
	leaq	.LC39(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L42:
	leaq	.LC40(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L41:
	leaq	.LC41(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L40:
	leaq	.LC42(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L39:
	leaq	.LC43(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L38:
	leaq	.LC44(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L37:
	leaq	.LC45(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L36:
	leaq	.LC46(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L35:
	leaq	.LC47(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L34:
	leaq	.LC48(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L33:
	leaq	.LC49(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L32:
	leaq	.LC50(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L31:
	leaq	.LC51(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L30:
	leaq	.LC52(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L29:
	leaq	.LC53(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L28:
	leaq	.LC54(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L27:
	leaq	.LC55(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L26:
	leaq	.LC56(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L25:
	leaq	.LC57(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L24:
	leaq	.LC58(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L23:
	leaq	.LC59(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L22:
	leaq	.LC60(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L21:
	leaq	.LC61(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L20:
	leaq	.LC62(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L19:
	leaq	.LC63(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L18:
	leaq	.LC64(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L17:
	leaq	.LC65(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L16:
	leaq	.LC66(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L15:
	leaq	.LC67(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L14:
	leaq	.LC68(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L13:
	leaq	.LC69(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L12:
	leaq	.LC70(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L11:
	leaq	.LC71(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L10:
	leaq	.LC72(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L9:
	leaq	.LC73(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L8:
	leaq	.LC74(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L7:
	leaq	.LC75(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L6:
	leaq	.LC76(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L5:
	leaq	.LC77(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L3:
	leaq	.LC78(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L84
.L2:
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	nop
.L84:
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LC76: 	.string	"Black and white"
.LC2: 	.string	"Detective/thriller"
.LC46: 	.string	"Religion"
.LC13: 	.string	"discussion/interview/debate"
.LC48: 	.string	"Literature"
.LC74: 	.string	"gardening"
.LC58: 	.string	"Remarkable people"
.LC63: 	.string	"Foreign countries/expeditions"
.LC62: 	.string	"Medicine/physiology/psychology"
.LC75: 	.string	"Original language"
.LC37: 	.string	"Rock/Pop"
.LC35: 	.string	"Cartoons/puppets"
.LC11: 	.string	"weather"
.LC8: 	.string	"Serious/classical/religious/historical movie/drama"
.LC36: 	.string	"Music"
.LC0: 	.string	""
.LC49: 	.string	"Film/Cinema"
.LC24: 	.string	"Athletics"
.LC31: 	.string	"Pre-school children's programmes"
.LC57: 	.string	"Economics/Social advisory "
.LC39: 	.string	"folk/traditional music"
.LC53: 	.string	"Arts/Culture magazines"
.LC19: 	.string	"Sports special events"
.LC68: 	.string	"Travel"
.LC78: 	.string	"Live broadcast"
.LC56: 	.string	"Magazines/reports/documentary"
.LC77: 	.string	"Unpublished"
.LC17: 	.string	"talk show"
.LC15: 	.string	"Game/quiz/contest"
.LC65: 	.string	"Further education"
.LC64: 	.string	"Social/spiritual sciences"
.LC61: 	.string	"Technology/Natural sciences"
.LC14: 	.string	"Show"
.LC6: 	.string	"Soap/melodrama/folkloric"
.LC22: 	.string	"Tennis/squash"
.LC45: 	.string	"Fine arts"
.LC33: 	.string	"Kids 10-16"
.LC25: 	.string	"Motorcycle Racing"
.LC34: 	.string	"Informational/educational/school programmes"
.LC50: 	.string	"Experimental film/video"
.LC67: 	.string	"Leisure Hobbies"
.LC28: 	.string	"Equestrian"
.LC21: 	.string	"Football/soccer"
.LC3: 	.string	"Adventure/western/war"
.LC38: 	.string	"classical music"
.LC44: 	.string	"Performing"
.LC27: 	.string	"Winter sports"
.LC5: 	.string	"Comedy"
.LC23: 	.string	"team sports"
.LC20: 	.string	"sports magazines"
.LC7: 	.string	"Romance"
.LC41: 	.string	"Opera/Musical"
.LC59: 	.string	"Education/Science/Factual"
.LC66: 	.string	"Languages"
.LC40: 	.string	"Jazz"
.LC52: 	.string	"New media"
.LC18: 	.string	"Sports"
.LC4: 	.string	"Sci-Fi/fantasy/horror"
.LC29: 	.string	"Martial sports"
.LC12: 	.string	"magazine"
.LC32: 	.string	"Kids 6-14"
.LC54: 	.string	"fashion"
.LC55: 	.string	"Social/political issues/Economics"
.LC70: 	.string	"Motoring"
.LC60: 	.string	"Nature/animals/environment"
.LC10: 	.string	"New"
.LC51: 	.string	"Broadcasting/press"
.LC1: 	.string	"Movie/drama"
.LC42: 	.string	"Ballet"
.LC73: 	.string	"Advertisement/shopping"
.LC69: 	.string	"Handicraft"
.LC16: 	.string	"variety"
.LC9: 	.string	"adult movie"
.LC43: 	.string	"Art"
.LC47: 	.string	"Popular culture/traditional arts"
.LC26: 	.string	"Water sport"
.LC30: 	.string	"Children"
.LC72: 	.string	"Cooking"
.LC71: 	.string	"Fitness"
