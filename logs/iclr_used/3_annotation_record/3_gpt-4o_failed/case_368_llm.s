
    .text
    .section    .rodata
# String literals
.LC_empty_str:
    .string ""

.LC_movie_drama_str:
    .string "Movie/drama"

.LC_detective_thriller_str:
    .string "Detective/thriller"

.LC_adventure_western_war_str:
    .string "Adventure/western/war"

.LC_sci_fi_fantasy_horror_str:
    .string "Sci-Fi/fantasy/horror"

.LC_comedy_str:
    .string "Comedy"

.LC_soap_melodrama_folkloric_str:
    .string "Soap/melodrama/folkloric"

.LC_romance_str:
    .string "Romance"

.LC_serious_classical_religious_historical_movie_drama_str:
    .string "Serious/classical/religious/historical movie/drama"

.LC_adult_movie_str:
    .string "adult movie"

.LC_news_str:
    .string "New"

.LC_weather_str:
    .string "weather"

.LC_magazine_str:
    .string "magazine"

.LC_discussion_interview_debate_str:
    .string "discussion/interview/debate"

.LC_show_str:
    .string "Show"

.LC_game_quiz_contest_str:
    .string "Game/quiz/contest"

.LC_variety_str:
    .string "variety"

.LC_talk_show_str:
    .string "talk show"

.LC_sports_str:
    .string "Sports"

.LC_sports_special_events_str:
    .string "Sports special events"

.LC_sports_magazines_str:
    .string "sports magazines"

.LC_football_soccer_str:
    .string "Football/soccer"

.LC_tennis_squash_str:
    .string "Tennis/squash"

.LC_team_sports_str:
    .string "team sports"

.LC_athletics_str:
    .string "Athletics"

.LC_motorcycle_racing_str:
    .string "Motorcycle Racing"

.LC_water_sport_str:
    .string "Water sport"

.LC_winter_sports_str:
    .string "Winter sports"

.LC_equestrian_str:
    .string "Equestrian"

.LC_martial_sports_str:
    .string "Martial sports"

.LC_children_str:
    .string "Children"

.LC_pre_school_childrens_programmes_str:
    .string "Pre-school children's programmes"

.LC_kids_6_14_str:
    .string "Kids 6-14"

.LC_kids_10_16_str:
    .string "Kids 10-16"

.LC_informational_educational_school_programmes_str:
    .string "Informational/educational/school programmes"

.LC_cartoons_puppets_str:
    .string "Cartoons/puppets"

.LC_music_str:
    .string "Music"

.LC_rock_pop_str:
    .string "Rock/Pop"

.LC_classical_music_str:
    .string "classical music"

.LC_folk_traditional_music_str:
    .string "folk/traditional music"

.LC_jazz_str:
    .string "Jazz"

.LC_opera_musical_str:
    .string "Opera/Musical"

.LC_ballet_str:
    .string "Ballet"

.LC_art_str:
    .string "Art"

.LC_performing_str:
    .string "Performing"

.LC_fine_arts_str:
    .string "Fine arts"

.LC_religion_str:
    .string "Religion"

.LC_popular_culture_traditional_arts_str:
    .string "Popular culture/traditional arts"

.LC_literature_str:
    .string "Literature"

.LC_film_cinema_str:
    .string "Film/Cinema"

.LC_experimental_film_video_str:
    .string "Experimental film/video"

.LC_broadcasting_press_str:
    .string "Broadcasting/press"

.LC_new_media_str:
    .string "New media"

.LC_arts_culture_magazines_str:
    .string "Arts/Culture magazines"

.LC_fashion_str:
    .string "fashion"

.LC_social_political_issues_economics_str:
    .string "Social/political issues/Economics"

.LC_magazines_reports_documentary_str:
    .string "Magazines/reports/documentary"

.LC_economics_social_advisory_str:
    .string "Economics/Social advisory"

.LC_remarkable_people_str:
    .string "Remarkable people"

.LC_education_science_factual_str:
    .string "Education/Science/Factual"

.LC_nature_animals_environment_str:
    .string "Nature/animals/environment"

.LC_technology_natural_sciences_str:
    .string "Technology/Natural sciences"

.LC_medicine_physiology_psychology_str:
    .string "Medicine/physiology/psychology"

.LC_foreign_countries_expeditions_str:
    .string "Foreign countries/expeditions"

.LC_social_spiritual_sciences_str:
    .string "Social/spiritual sciences"

.LC_further_education_str:
    .string "Further education"

.LC_languages_str:
    .string "Languages"

.LC_leisure_hobbies_str:
    .string "Leisure Hobbies"

.LC_travel_str:
    .string "Travel"

.LC_handicraft_str:
    .string "Handicraft"

.LC_motoring_str:
    .string "Motoring"

.LC_fitness_str:
    .string "Fitness"

.LC_cooking_str:
    .string "Cooking"

.LC_advertisement_shopping_str:
    .string "Advertisement/shopping"

.LC_gardening_str:
    .string "gardening"

.LC_original_language_str:
    .string "Original language"

.LC_black_and_white_str:
    .string "Black and white"

.LC_unpublished_str:
    .string "Unpublished"

.LC_live_broadcast_str:
    .string "Live broadcast"

    .text
    .globl  DVBGenreCode
    .type   DVBGenreCode, @function
DVBGenreCode:
.LF_DVBGenreCode_entry:
    # Prologue
    endbr64
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movzbl  %dil, %eax
    movb    %al, -9(%rbp)
    movq    .LC_empty_str(%rip), %rax
    movq    %rax, -8(%rbp)

    # Switch statement
    movzbl  -9(%rbp), %eax
    cmpb    $0x00, %al
    je      .L_case_0x00
    cmpb    $0x10, %al
    je      .L_case_0x10
    cmpb    $0x11, %al
    je      .L_case_0x11
    cmpb    $0x12, %al
    je      .L_case_0x12
    cmpb    $0x13, %al
    je      .L_case_0x13
    cmpb    $0x14, %al
    je      .L_case_0x14
    cmpb    $0x15, %al
    je      .L_case_0x15
    cmpb    $0x16, %al
    je      .L_case_0x16
    cmpb    $0x17, %al
    je      .L_case_0x17
    cmpb    $0x18, %al
    je      .L_case_0x18
    cmpb    $0x20, %al
    je      .L_case_0x20
    cmpb    $0x21, %al
    je      .L_case_0x21
    cmpb    $0x22, %al
    je      .L_case_0x22
    cmpb    $0x23, %al
    je      .L_case_0x23
    cmpb    $0x24, %al
    je      .L_case_0x24
    cmpb    $0x30, %al
    je      .L_case_0x30
    cmpb    $0x31, %al
    je      .L_case_0x31
    cmpb    $0x32, %al
    je      .L_case_0x32
    cmpb    $0x33, %al
    je      .L_case_0x33
    cmpb    $0x40, %al
    je      .L_case_0x40
    cmpb    $0x41, %al
    je      .L_case_0x41
    cmpb    $0x42, %al
    je      .L_case_0x42
    cmpb    $0x43, %al
    je      .L_case_0x43
    cmpb    $0x44, %al
    je      .L_case_0x44
    cmpb    $0x45, %al
    je      .L_case_0x45
    cmpb    $0x46, %al
    je      .L_case_0x46
    cmpb    $0x47, %al
    je      .L_case_0x47
    cmpb    $0x48, %al
    je      .L_case_0x48
    cmpb    $0x49, %al
    je      .L_case_0x49
    cmpb    $0x4A, %al
    je      .L_case_0x4A
    cmpb    $0x4B, %al
    je      .L_case_0x4B
    cmpb    $0x50, %al
    je      .L_case_0x50
    cmpb    $0x51, %al
    je      .L_case_0x51
    cmpb    $0x52, %al
    je      .L_case_0x52
    cmpb    $0x53, %al
    je      .L_case_0x53
    cmpb    $0x54, %al
    je      .L_case_0x54
    cmpb    $0x55, %al
    je      .L_case_0x55
    cmpb    $0x60, %al
    je      .L_case_0x60
    cmpb    $0x61, %al
    je      .L_case_0x61
    cmpb    $0x62, %al
    je      .L_case_0x62
    cmpb    $0x63, %al
    je      .L_case_0x63
    cmpb    $0x64, %al
    je      .L_case_0x64
    cmpb    $0x65, %al
    je      .L_case_0x65
    cmpb    $0x66, %al
    je      .L_case_0x66
    cmpb    $0x70, %al
    je      .L_case_0x70
    cmpb    $0x71, %al
    je      .L_case_0x71
    cmpb    $0x72, %al
    je      .L_case_0x72
    cmpb    $0x73, %al
    je      .L_case_0x73
    cmpb    $0x74, %al
    je      .L_case_0x74
    cmpb    $0x75, %al
    je      .L_case_0x75
    cmpb    $0x76, %al
    je      .L_case_0x76
    cmpb    $0x77, %al
    je      .L_case_0x77
    cmpb    $0x78, %al
    je      .L_case_0x78
    cmpb    $0x79, %al
    je      .L_case_0x79
    cmpb    $0x7A, %al
    je      .L_case_0x7A
    cmpb    $0x7B, %al
    je      .L_case_0x7B
    cmpb    $0x80, %al
    je      .L_case_0x80
    cmpb    $0x81, %al
    je      .L_case_0x81
    cmpb    $0x82, %al
    je      .L_case_0x82
    cmpb    $0x83, %al
    je      .L_case_0x83
    cmpb    $0x90, %al
    je      .L_case_0x90
    cmpb    $0x91, %al
    je      .L_case_0x91
    cmpb    $0x92, %al
    je      .L_case_0x92
    cmpb    $0x93, %al
    je      .L_case_0x93
    cmpb    $0x94, %al
    je      .L_case_0x94
    cmpb    $0x95, %al
    je      .L_case_0x95
    cmpb    $0x96, %al
    je      .L_case_0x96
    cmpb    $0x97, %al
    je      .L_case_0x97
    cmpb    $0xA0, %al
    je      .L_case_0xA0
    cmpb    $0xA1, %al
    je      .L_case_0xA1
    cmpb    $0xA2, %al
    je      .L_case_0xA2
    cmpb    $0xA3, %al
    je      .L_case_0xA3
    cmpb    $0xA4, %al
    je      .L_case_0xA4
    cmpb    $0xA5, %al
    je      .L_case_0xA5
    cmpb    $0xA6, %al
    je      .L_case_0xA6
    cmpb    $0xA7, %al
    je      .L_case_0xA7
    cmpb    $0xB0, %al
    je      .L_case_0xB0
    cmpb    $0xB1, %al
    je      .L_case_0xB1
    cmpb    $0xB2, %al
    je      .L_case_0xB2
    cmpb    $0xB3, %al
    je      .L_case_0xB3
    jmp     .L_default

.L_case_0x00:
    movq    .LC_empty_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x10:
    movq    .LC_movie_drama_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x11:
    movq    .LC_detective_thriller_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x12:
    movq    .LC_adventure_western_war_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x13:
    movq    .LC_sci_fi_fantasy_horror_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x14:
    movq    .LC_comedy_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x15:
    movq    .LC_soap_melodrama_folkloric_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x16:
    movq    .LC_romance_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x17:
    movq    .LC_serious_classical_religious_historical_movie_drama_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x18:
    movq    .LC_adult_movie_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x20:
    movq    .LC_news_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x21:
    movq    .LC_weather_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x22:
    movq    .LC_magazine_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x23:
    movq    .LC_magazine_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x24:
    movq    .LC_discussion_interview_debate_str(%rip), %rax
    movq    %rax, -8(%rbp)
    jmp     .L_return

.L_case_0x30:
    movq    .LC_show_str(%rip), %