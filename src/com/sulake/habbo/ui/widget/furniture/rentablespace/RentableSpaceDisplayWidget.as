// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.rentablespace.RentableSpaceDisplayWidget

package com.sulake.habbo.ui.widget.furniture.rentablespace
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import flash.utils.Dictionary;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.handler._SafeStr_3304;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.core.window.components.IItemListWindow;

    public class RentableSpaceDisplayWidget extends RoomWidgetBase 
    {

        private static var _SafeStr_4123:Dictionary = new Dictionary();

        private var _window:_SafeStr_3133;
        private var _roomObject:IRoomObject;

        {
            _SafeStr_4123[100] = "${rentablespace.widget.error_reason_already_rented}";
            _SafeStr_4123[101] = "${rentablespace.widget.error_reason_not_rented}";
            _SafeStr_4123[102] = "${rentablespace.widget.error_reason_not_rented_by_you}";
            _SafeStr_4123[103] = "${rentablespace.widget.error_reason_can_rent_only_one_space}";
            _SafeStr_4123[200] = "${rentablespace.widget.error_reason_not_enough_credits}";
            _SafeStr_4123[201] = "${rentablespace.widget.error_reason_not_enough_duckets}";
            _SafeStr_4123[202] = "${rentablespace.widget.error_reason_no_permission}";
            _SafeStr_4123[203] = "${rentablespace.widget.error_reason_no_habboclub}";
            _SafeStr_4123[300] = "${rentablespace.widget.error_reason_disabled}";
            _SafeStr_4123[400] = "${rentablespace.widget.error_reason_generic}";
        }

        public function RentableSpaceDisplayWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            ownHandler.widget = this;
        }

        private function get ownHandler():_SafeStr_3304
        {
            return (_SafeStr_3914 as _SafeStr_3304);
        }

        public function hide(_arg_1:IRoomObject):void
        {
            if (_roomObject != _arg_1)
            {
                return;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _roomObject = null;
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            hide(_roomObject);
            super.dispose();
        }

        override public function get mainWindow():_SafeStr_3109
        {
            return (_window);
        }

        public function show(_arg_1:IRoomObject):void
        {
            _roomObject = _arg_1;
            updateWidgetState();
        }

        private function createWindow():void
        {
            if (_window != null)
            {
                return;
            };
            _window = (windowManager.buildFromXML(XML(assets.getAssetByName("rentablespace_xml").content)) as _SafeStr_3133);
            _window.procedure = windowProcedure;
            _window.center();
            _window.findChildByName("rent_button").disable();
            _window.findChildByName("rented_view").visible = false;
            _window.findChildByName("error_view").visible = false;
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    switch (_arg_2.name)
                    {
                        case "header_button_close":
                        case "error_button_close":
                            hide(_roomObject);
                            break;
                        case "rent_button":
                            ownHandler.rentSpace(_roomObject.getId());
                            break;
                        case "cancel_rent_button":
                            ownHandler.cancelRent(_roomObject.getId());
                    };
                    return;
            };
        }

        public function updateWidgetState():void
        {
            if (_roomObject == null)
            {
                return;
            };
            ownHandler.getRentableSpaceStatus(_roomObject.getId());
        }

        public function populateRentInfo(_arg_1:Boolean, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:int):void
        {
            var _local_8:Boolean;
            if (_roomObject == null)
            {
                return;
            };
            createWindow();
            if (_arg_1)
            {
                _window.findChildByName("rent_view").visible = false;
                _window.findChildByName("error_view").visible = false;
                _window.findChildByName("rented_view").visible = true;
                _window.findChildByName("renter_name").caption = _arg_5;
                _window.findChildByName("time_remaining_label").caption = FriendlyTime.getFriendlyTime(ownHandler.container.localization, _arg_6);
                _window.findChildByName("cancel_rent_button").visible = ((ownHandler.container.isOwnerOfFurniture(_roomObject)) || (ownHandler.container.sessionDataManager.hasSecurity(5)));
                IItemListWindow(_window.findChildByName("rented_view")).arrangeListItems();
            }
            else
            {
                _window.findChildByName("rented_view").visible = false;
                _window.findChildByName("error_view").visible = false;
                _window.findChildByName("rent_view").visible = true;
                _window.findChildByName("price_label").caption = (_arg_7.toString() + " x");
                _local_8 = (_arg_7 <= ownHandler.getUsersCreditAmount());
                if (!_arg_2)
                {
                    _window.findChildByName("cant_rent_error").caption = _SafeStr_4123[_arg_3];
                }
                else
                {
                    if (!_local_8)
                    {
                        _window.findChildByName("cant_rent_error").caption = _SafeStr_4123[200];
                    }
                    else
                    {
                        _window.findChildByName("cant_rent_error").visible = false;
                        _window.findChildByName("rent_button").enable();
                    };
                };
                IItemListWindow(_window.findChildByName("rent_view")).arrangeListItems();
            };
            if (!_window.visible)
            {
                _window.visible = true;
            };
        }

        public function showErrorView(_arg_1:int):void
        {
            _window.findChildByName("rent_view").visible = false;
            _window.findChildByName("rented_view").visible = false;
            _window.findChildByName("error_view").visible = true;
            _window.findChildByName("error_message").caption = _SafeStr_4123[_arg_1];
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.rentablespace

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3304 = "_-cO" (String#11463, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4123 = "_-JM" (String#4606, DoABC#4)


