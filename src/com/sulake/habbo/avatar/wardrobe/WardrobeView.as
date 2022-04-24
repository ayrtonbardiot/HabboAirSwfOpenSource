// by nota

//com.sulake.habbo.avatar.wardrobe.WardrobeView

package com.sulake.habbo.avatar.wardrobe
{
    import com.sulake.habbo.avatar.common.ISideContentView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;

    public class WardrobeView implements ISideContentView 
    {

        private var _window:_SafeStr_3133;
        private var _SafeStr_4619:WardrobeModel;
        private var _SafeStr_6585:IItemListWindow;
        private var _SafeStr_6586:IItemListWindow;
        private var _SafeStr_6584:_SafeStr_3109;

        public function WardrobeView(_arg_1:WardrobeModel)
        {
            _SafeStr_4619 = _arg_1;
            var _local_2:XmlAsset = (_SafeStr_4619.controller.manager.assets.getAssetByName("avatareditor_wardrobe_base") as XmlAsset);
            _window = (_SafeStr_4619.controller.manager.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            _SafeStr_6585 = (_window.findChildByName("hc_slots") as IItemListWindow);
            _SafeStr_6586 = (_window.findChildByName("vip_slots") as IItemListWindow);
            _SafeStr_6584 = _window.findChildByName("slot_template");
            if (_SafeStr_6584)
            {
                _window.removeChild(_SafeStr_6584);
            };
            _window.visible = false;
        }

        public function get slotWindowTemplate():_SafeStr_3109
        {
            return (_SafeStr_6584);
        }

        public function dispose():void
        {
            _SafeStr_4619 = null;
            _SafeStr_6585 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function update():void
        {
            var _local_3:* = null;
            var _local_2:int;
            if (_SafeStr_6585)
            {
                _SafeStr_6585.removeListItems();
            };
            if (_SafeStr_6586)
            {
                _SafeStr_6586.removeListItems();
            };
            var _local_1:Array = _SafeStr_4619.slots;
            _local_2 = 0;
            while (_local_2 < _local_1.length)
            {
                _local_3 = _local_1[_local_2];
                if (_local_2 < 5)
                {
                    if (_SafeStr_6585)
                    {
                        _SafeStr_6585.addListItem(_local_3.view);
                        _local_3.view.visible = true;
                    };
                }
                else
                {
                    if (_SafeStr_6586)
                    {
                        _SafeStr_6586.addListItem(_local_3.view);
                        _local_3.view.visible = true;
                    };
                };
                _local_2++;
            };
        }

        public function getWindowContainer():_SafeStr_3133
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.avatar.wardrobe

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_6584 = "_-61G" (String#12712, DoABC#4)
// _SafeStr_6585 = "_-11g" (String#7965, DoABC#4)
// _SafeStr_6586 = "_-j" (String#11504, DoABC#4)


