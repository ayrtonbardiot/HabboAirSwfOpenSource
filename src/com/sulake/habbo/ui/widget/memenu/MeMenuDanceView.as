// by nota

//com.sulake.habbo.ui.widget.memenu.MeMenuDanceView

package com.sulake.habbo.ui.widget.memenu
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MeMenuDanceView implements IMeMenuView 
    {

        private var _SafeStr_4981:MeMenuWidget;
        private var _window:_SafeStr_3133;


        public function init(_arg_1:MeMenuWidget, _arg_2:String):void
        {
            _SafeStr_4981 = _arg_1;
            createWindow(_arg_2);
        }

        public function dispose():void
        {
            _SafeStr_4981 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get window():_SafeStr_3133
        {
            return (_window);
        }

        private function createWindow(_arg_1:String):void
        {
            var _local_7:int;
            var _local_5:Boolean;
            var _local_2:* = null;
            var _local_6:XmlAsset = (_SafeStr_4981.assets.getAssetByName("memenu_dance") as XmlAsset);
            if (_local_6)
            {
                _window = (_SafeStr_4981.windowManager.buildFromXML((_local_6.content as XML)) as _SafeStr_3133);
            };
            if (_window == null)
            {
                throw (new Error("Failed to construct dance view window from XML!"));
            };
            _window.name = _arg_1;
            var _local_3:Array = [];
            _local_3.push(_window.findChildByName("stop_dancing_button"));
            _local_3.push(_window.findChildByName("back_btn"));
            for each (_local_2 in _local_3)
            {
                if (_local_2 != null)
                {
                    _local_2.addEventListener("WME_CLICK", onButtonClicked);
                };
            };
            var _local_8:IItemListWindow = (_window.findChildByName("buttonContainer") as IItemListWindow);
            var _local_4:XmlAsset = (_SafeStr_4981.assets.getAssetByName("memenu_dance_button") as XmlAsset);
            if (_local_8 != null)
            {
                _local_7 = 1;
                while (_local_7 <= 4)
                {
                    _local_5 = false;
                    if (RoomWidgetDanceMessage._SafeStr_5981.indexOf(_local_7) >= 0)
                    {
                        _local_5 = _SafeStr_4981.allowHabboClubDances;
                    }
                    else
                    {
                        _local_5 = true;
                    };
                    if (_local_5)
                    {
                        _local_2 = (_SafeStr_4981.windowManager.buildFromXML((_local_4.content as XML)) as _SafeStr_3109);
                        _local_2.name = (("dance_" + _local_7) + "_button");
                        _local_2.caption = (("${widget.memenu.dance" + _local_7) + "}");
                        _local_2.addEventListener("WME_CLICK", onButtonClicked);
                        _local_8.addListItemAt(_local_2, (_local_8.numListItems - 1));
                        if (_SafeStr_4981.hasEffectOn)
                        {
                            _local_2.disable();
                        }
                        else
                        {
                            _local_2.enable();
                        };
                    };
                    _local_7++;
                };
            };
            var _local_9:_SafeStr_3109 = _window.findChildByName("club_info");
            if (((!(_local_9 == null)) && (_SafeStr_4981.isHabboClubActive)))
            {
                _local_9.visible = false;
            };
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_5:* = null;
            var _local_3:int;
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            var _local_4:String = _local_2.name;
            switch (_local_4)
            {
                case "dance_1_button":
                case "dance_2_button":
                case "dance_3_button":
                case "dance_4_button":
                    _local_5 = _local_4.split("_");
                    _local_3 = parseInt(_local_5[1]);
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(_local_3));
                    _SafeStr_4981.isDancing = true;
                    _SafeStr_4981.hide();
                    HabboTracking.getInstance().trackEventLog("MeMenu", "click", "dance_start");
                    return;
                case "stop_dancing_button":
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetDanceMessage(0));
                    _SafeStr_4981.isDancing = false;
                    _SafeStr_4981.hide();
                    HabboTracking.getInstance().trackEventLog("MeMenu", "click", "dance_stop");
                    return;
                case "back_btn":
                    _SafeStr_4981.changeView("me_menu_top_view");
                    return;
                default:
                    _SafeStr_14.log(("Me Menu Dance View: unknown button: " + _local_4));
                    return;
            };
        }

        public function updateUnseenItemCount(_arg_1:String, _arg_2:int):void
        {
        }


    }
}//package com.sulake.habbo.ui.widget.memenu

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5981 = "_-i1P" (String#16317, DoABC#4)


