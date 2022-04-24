// by nota

//com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl

package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window.components._SafeStr_3269;
    import _-Ja._SafeStr_1629;
    import _-o1x._SafeStr_960;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class EnforceCategoryCtrl 
    {

        private var _navigator:_SafeStr_1697;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4003:IModalDialog;
        private var _categorySelection:int = 0;
        private var _tradeModeSelection:int = 0;
        private var _SafeStr_5228:Array = [];

        public function EnforceCategoryCtrl(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
        }

        public function show(_arg_1:int):void
        {
            close();
            _SafeStr_4003 = _navigator.windowManager.buildModalDialogFromXML((_navigator.assets.getAssetByName("enforce_category_xml").content as XML));
            _window = (_SafeStr_4003.rootWindow as _SafeStr_3263);
            _window.procedure = windowProcedure;
            _window.center();
            _window.findChildByName("header_button_close").visible = false;
            var _local_2:_SafeStr_3269 = (_window.findChildByName("trade_mode") as _SafeStr_3269);
            var _local_5:Array = [];
            _local_5.push("${navigator.roomsettings.trade_not_allowed}");
            _local_5.push("${navigator.roomsettings.trade_not_with_Controller}");
            _local_5.push("${navigator.roomsettings.trade_allowed}");
            _local_2.populate(_local_5);
            _local_2.selection = 0;
            var _local_6:_SafeStr_3269 = (_window.findChildByName("category") as _SafeStr_3269);
            _SafeStr_5228 = [];
            for each (var _local_7:_SafeStr_1629 in _navigator.data.visibleCategories)
            {
                if (((!(_local_7.automatic)) && ((!(_local_7.staffOnly)) || ((_local_7.staffOnly) && (_navigator.sessionData.hasSecurity(7))))))
                {
                    _SafeStr_5228.push(_local_7);
                };
            };
            var _local_3:Array = [];
            for each (var _local_4:_SafeStr_1629 in _SafeStr_5228)
            {
                _local_3.push(_local_4.visibleName);
            };
            _local_6.populate(_local_3);
            _local_6.selection = 0;
        }

        private function close():void
        {
            if (((_SafeStr_4003) && (_window)))
            {
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
                _window = null;
            };
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "ok":
                        _local_3 = _SafeStr_1629(_SafeStr_5228[Math.max(0, _categorySelection)]).nodeId;
                        _navigator.communication.connection.send(new _SafeStr_960(_navigator.data.currentRoomId, _local_3, _tradeModeSelection));
                        close();
                };
            }
            else
            {
                if (_arg_1.type == "WE_SELECTED")
                {
                    switch (_arg_2.name)
                    {
                        case "category":
                            _categorySelection = _SafeStr_3269(_arg_2).selection;
                            return;
                        case "trade_mode":
                            _tradeModeSelection = _SafeStr_3269(_arg_2).selection;
                            return;
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_1629 = "_-K0" (String#4251, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_5228 = "_-m1S" (String#9557, DoABC#4)
// _SafeStr_960 = "_-P1K" (String#28579, DoABC#4)


