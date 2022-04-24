// by nota

//com.sulake.habbo.window.widgets.IRoomPreviewerWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window._SafeStr_3179;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import flash.display.BitmapData;

    public /*dynamic*/ interface IRoomPreviewerWidget extends _SafeStr_3179 
    {

        function get scale():int;
        function set scale(_arg_1:int):void;
        function get roomPreviewer():RoomPreviewer;
        function showPreview(_arg_1:BitmapData):void;
        function get offsetX():int;
        function set offsetX(_arg_1:int):void;
        function get offsetY():int;
        function set offsetY(_arg_1:int):void;
        function get zoom():int;
        function set zoom(_arg_1:int):void;

    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3179 = "_-wC" (String#2737, DoABC#4)


