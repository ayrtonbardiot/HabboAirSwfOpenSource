// by nota

//com.sulake.habbo.ui.widget.doorbell.DoorbellView

package com.sulake.habbo.ui.widget.doorbell
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class DoorbellView 
    {

        private var _SafeStr_3747:DoorbellWidget;
        private var _frame:_SafeStr_3263;
        private var _SafeStr_4162:IItemListWindow;

        public function DoorbellView(_arg_1:DoorbellWidget)
        {
            _SafeStr_3747 = _arg_1;
        }

        public function dispose():void
        {
            _SafeStr_4162 = null;
            _SafeStr_3747 = null;
            if (_frame)
            {
                _frame.dispose();
                _frame = null;
            };
        }

        public function update():void
        {
            var _local_1:int;
            if (_SafeStr_3747.users.length == 0)
            {
                hide();
                return;
            };
            if (_frame == null)
            {
                createMainWindow();
            };
            _frame.visible = true;
            if (_SafeStr_4162 != null)
            {
                _SafeStr_4162.destroyListItems();
                _local_1 = 0;
                while (_local_1 < _SafeStr_3747.users.length)
                {
                    _SafeStr_4162.addListItem(createListItem((_SafeStr_3747.users[_local_1] as String), _local_1));
                    _local_1++;
                };
            };
        }

        public function get mainWindow():_SafeStr_3109
        {
            return (_frame);
        }

        private function createListItem(_arg_1:String, _arg_2:int):_SafeStr_3109
        {
            var _local_5:* = null;
            var _local_4:XmlAsset = (_SafeStr_3747.assets.getAssetByName("doorbell_list_entry") as XmlAsset);
            var _local_3:_SafeStr_3133 = (_SafeStr_3747.windowManager.buildFromXML((_local_4.content as XML)) as _SafeStr_3133);
            if (_local_3 == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            var _local_6:ITextWindow = (_local_3.findChildByName("user_name") as ITextWindow);
            if (_local_6 != null)
            {
                _local_6.caption = _arg_1;
            };
            _local_3.name = _arg_1;
            if ((_arg_2 % 2) == 0)
            {
                _local_3.color = 0xFFFFFFFF;
            };
            _local_5 = _local_3.findChildByName("accept");
            if (_local_5 != null)
            {
                _local_5.addEventListener("WME_CLICK", onButtonClicked);
            };
            _local_5 = _local_3.findChildByName("deny");
            if (_local_5 != null)
            {
                _local_5.addEventListener("WME_CLICK", onButtonClicked);
            };
            return (_local_3);
        }

        private function hide():void
        {
            if (_frame)
            {
                _frame.dispose();
                _frame = null;
            };
        }

        private function createMainWindow():void
        {
            if (_frame != null)
            {
                return;
            };
            var _local_2:XmlAsset = (_SafeStr_3747.assets.getAssetByName("doorbell") as XmlAsset);
            _frame = (_SafeStr_3747.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3263);
            if (_frame == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _SafeStr_4162 = (_frame.findChildByName("user_list") as IItemListWindow);
            _frame.visible = false;
            var _local_1:_SafeStr_3109 = _frame.findChildByTag("close");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", onClose);
            };
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_3747.denyAll();
        }

        private function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:String = _arg_1.window.parent.name;
            switch (_arg_1.window.name)
            {
                case "accept":
                    _SafeStr_3747.accept(_local_2);
                    return;
                case "deny":
                    _SafeStr_3747.deny(_local_2);
                    return;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.doorbell

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3747 = "_-V1" (String#3373, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)


