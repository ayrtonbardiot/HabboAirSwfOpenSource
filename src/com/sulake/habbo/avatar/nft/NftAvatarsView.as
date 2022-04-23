// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.nft.NftAvatarsView

package com.sulake.habbo.avatar.nft
{
    import com.sulake.habbo.avatar.common._SafeStr_3396;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.avatar.wardrobe.NftOutfit;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class NftAvatarsView implements _SafeStr_3396 
    {

        private var _window:_SafeStr_3133;
        private var _SafeStr_4619:NftAvatarsModel;
        private var _SafeStr_6781:IItemGridWindow;

        public function NftAvatarsView(_arg_1:NftAvatarsModel)
        {
            _SafeStr_4619 = _arg_1;
        }

        public function init():void
        {
            if (_SafeStr_6781)
            {
                _SafeStr_6781.removeGridItems();
            };
            if (!_window)
            {
                _window = (_SafeStr_4619.controller.view.getCategoryContainer("nfts") as _SafeStr_3133);
                _SafeStr_6781 = (_window.findChildByName("nfts") as IItemGridWindow);
                _window.visible = false;
            };
            update();
        }

        public function dispose():void
        {
            _SafeStr_6781.removeGridItems();
            _window = null;
            _SafeStr_4619 = null;
        }

        public function update():void
        {
            var _local_2:* = null;
            _SafeStr_6781.removeGridItems();
            for each (var _local_1:NftOutfit in _SafeStr_4619.nftAvatars)
            {
                _local_2 = _local_1.view.window;
                _SafeStr_6781.addGridItem(_local_2);
                _local_2.procedure = nftAvatarsEventProc;
            };
        }

        public function getWindowContainer():_SafeStr_3133
        {
            return (_window);
        }

        private function nftAvatarsEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109=null):void
        {
            var _local_3:int;
            if (_arg_2 == null)
            {
                _arg_2 = (_arg_1.target as _SafeStr_3109);
            };
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _SafeStr_6781.getGridItemIndex(_arg_2.parent);
                _SafeStr_4619.selectNftAvatar(_local_3);
            };
        }

        public function switchCategory(_arg_1:String):void
        {
        }

        public function showPalettes(_arg_1:String, _arg_2:int):void
        {
        }

        public function reset():void
        {
        }


    }
}//package com.sulake.habbo.avatar.nft

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3396 = "_-wy" (String#6678, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_6781 = "_-G1q" (String#7978, DoABC#4)


