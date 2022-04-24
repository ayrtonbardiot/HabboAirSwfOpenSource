// by nota

//com.sulake.habbo.ui.widget.furniture.video.VimeoDisplayWidget

package com.sulake.habbo.ui.widget.furniture.video
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.vimeo.api.VimeoPlayer;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler._SafeStr_3372;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3189;
    import flash.display.DisplayObject;
    import flash.events.MouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events._SafeStr_3116;

    public class VimeoDisplayWidget extends RoomWidgetBase 
    {

        private static const _SafeStr_9030:String = "9a106b76302cbce891b714afdc6a0c93";

        private var _SafeStr_4136:VimeoPlayer;
        private var _window:_SafeStr_3133;
        private var _roomObject:IRoomObject;

        public function VimeoDisplayWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:IAssetLibrary, _arg_4:_SafeStr_18)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            ownHandler.widget = this;
        }

        private function get ownHandler():_SafeStr_3372
        {
            return (_SafeStr_3914 as _SafeStr_3372);
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_window);
        }

        public function show(_arg_1:IRoomObject, _arg_2:Boolean, _arg_3:int):void
        {
            _roomObject = _arg_1;
            createWindow(_arg_2, _arg_3);
            _window.visible = true;
        }

        private function createWindow(_arg_1:Boolean, _arg_2:int):void
        {
            if (_window != null)
            {
                return;
            };
            _window = (windowManager.buildFromXML(XML(assets.getAssetByName("vimeo_viewer_xml").content)) as _SafeStr_3133);
            _window.findChildByName("video_id_editor").visible = _arg_1;
            _window.findChildByName("video_wrapper").visible = (_arg_2 > 0);
            _window.procedure = windowProcedure;
            _window.center();
            var _local_3:_SafeStr_3189 = _SafeStr_3189(_window.findChildByName("video_wrapper"));
            _SafeStr_4136 = new VimeoPlayer("9a106b76302cbce891b714afdc6a0c93", _arg_2, _local_3.width, _local_3.height);
            _local_3.setDisplayObject(_SafeStr_4136);
            _SafeStr_4136.addEventListener("mouseUp", onVideoMouseEvent);
            _SafeStr_4136.addEventListener("mouseMove", onVideoMouseEvent);
        }

        private function onVideoMouseEvent(_arg_1:MouseEvent):void
        {
            if (_window != null)
            {
                DisplayObject(_arg_1.target).stage.dispatchEvent(_arg_1);
            };
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                            hide(_roomObject);
                    };
                    return;
                case "WE_RESIZE":
                    switch (_arg_2.name)
                    {
                        case "video_wrapper":
                            if (_SafeStr_4136 != null)
                            {
                                _SafeStr_4136.setSize(_arg_2.width, _arg_2.height);
                            };
                    };
                    return;
                case "WKE_KEY_DOWN":
                    if (WindowKeyboardEvent(_arg_1).charCode == 13)
                    {
                        _local_3 = _window.findChildByName("video_id").caption;
                        ownHandler.setVideo(_roomObject, _local_3);
                        _window.findChildByName("video_wrapper").visible = (_local_3 > 0);
                        _SafeStr_4136.loadVideo(_local_3);
                    };
                    return;
            };
        }

        public function hide(_arg_1:IRoomObject):void
        {
            if (_roomObject != _arg_1)
            {
                return;
            };
            if (_SafeStr_4136 != null)
            {
                _SafeStr_4136.destroy();
                _SafeStr_4136 = null;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _roomObject = null;
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.video

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3372 = "_-yN" (String#10916, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4136 = "_-w1a" (String#2353, DoABC#4)
// _SafeStr_9030 = "_-Jc" (String#39866, DoABC#4)


