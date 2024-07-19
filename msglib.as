
    #module

    // msglibを初期化します（命令）
    // id=ウィンドウID
    // style=メッセージボックスのスタイル
    // maxInput=メッセージボックスの最大入力文字数
    // size_x=メモリ上のウィンドウサイズX
    // size_y=メモリ上のウィンドウサイズY
    // mode=ウィンドウモード
    // pos_x=ウィンドウ位置X
    // pos_y=ウィンドウ位置Y
    // winsize_x=ウィンドウサイズX
    // winsize_y=ウィンドウサイズY
    #deffunc func_init_msglib int id, int style, int maxInput, int size_x, int size_y, int mode, int pos_x, int pos_y

        text = ""

        screen id, size_x, size_y, mode, pos_x, pos_y
        mesbox text, size_x, size_y -24, style, maxInput
        objid = stat

        win.id = 1


    return

    // メッセージを出力します（命令）
    // msg=出力メッセージ
    // id=ウィンドウID
    #deffunc func_putmes_msglib str msg, int id

        if ( win.id != 1 ) : return -1
        stack = ginfo_sel
        gsel id, 0

        text += msg
        objprm objid, text

        gsel stack, 0

    return 0

    // メッセージを消去します（命令）
    // id=ウィンドウID
    #deffunc func_cls_msglib int id

        if ( win.id != 1 ) : return -1
        stack = ginfo_sel
        gsel id, 0

        text = ""
        objprm objid, text

        gsel stack, 0

    return 0

    // msglibを初期化します
    // id=ウィンドウID
    // style=メッセージボックスのスタイル
    // maxInput=メッセージボックスの最大入力文字数
    // size_x=メモリ上のウィンドウサイズX
    // size_y=メモリ上のウィンドウサイズY
    // mode=ウィンドウモード
    // pos_x=ウィンドウ位置X
    // pos_y=ウィンドウ位置Y
    // winsize_x=ウィンドウサイズX
    // winsize_y=ウィンドウサイズY
    #define global init_msglib(%1=0, %2=1, %3=-1, %4=640, %5=480, %6=0, %7=-1, %8=-1) func_init_msglib %1, %2, %3, %4, %5, %6, %7, %8

    // メッセージを出力します
    // msg=出力メッセージ
    // id=ウィンドウID
    #define global putmes_msglib(%1, %2=0) func_putmes_msglib %1, %2

    // メッセージを消去します
    // id=ウィンドウID
    #define global cls_msglib(%1=0) func_cls_msglib %1


    #global