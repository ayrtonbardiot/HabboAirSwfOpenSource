// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.club.ClubGiftConfirmationDialog

package com.sulake.habbo.catalog.club
{
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;

    public class ClubGiftConfirmationDialog 
    {

        private var _offer:_SafeStr_3141;
        private var _SafeStr_4360:ClubGiftController;
        private var _SafeStr_3882:_SafeStr_3263;

        public function ClubGiftConfirmationDialog(_arg_1:ClubGiftController, _arg_2:_SafeStr_3141)
        {
            _offer = _arg_2;
            _SafeStr_4360 = _arg_1;
            showConfirmation();
        }

        public function dispose():void
        {
            _SafeStr_4360 = null;
            _offer = null;
            if (_SafeStr_3882)
            {
                _SafeStr_3882.dispose();
                _SafeStr_3882 = null;
            };
        }

        public function showConfirmation():void
        {
            if (((!(_offer)) || (!(_SafeStr_4360))))
            {
                return;
            };
            _SafeStr_3882 = (createWindow("club_gift_confirmation") as _SafeStr_3263);
            if (!_SafeStr_3882)
            {
                return;
            };
            _SafeStr_3882.procedure = windowEventHandler;
            _SafeStr_3882.center();
            var _local_2:ITextWindow = (_SafeStr_3882.findChildByName("item_name") as ITextWindow);
            if (_local_2)
            {
                _local_2.text = getProductName();
            };
            var _local_1:_SafeStr_3133 = (_SafeStr_3882.findChildByName("image_border") as _SafeStr_3133);
            if (!_local_1)
            {
                return;
            };
            if (!_offer.productContainer)
            {
                return;
            };
            _offer.productContainer.view = _local_1;
            _offer.productContainer.initProductIcon(_SafeStr_4360.roomEngine);
        }

        private function getProductName():String
        {
            var _local_1:* = null;
            if (((_offer) && (_offer.product)))
            {
                _local_1 = _offer.product.productData;
                if (_local_1)
                {
                    return (_local_1.name);
                };
            };
            return ("");
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((((!(_arg_1)) || (!(_arg_2))) || (!(_SafeStr_4360))) || (!(_offer))))
            {
                return;
            };
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "select_button":
                    _SafeStr_4360.confirmSelection(_offer.localizationId);
                    return;
                case "header_button_close":
                case "cancel_button":
                    _SafeStr_4360.closeConfirmation();
                    return;
            };
        }

        private function createWindow(_arg_1:String):_SafeStr_3109
        {
            if ((((!(_SafeStr_4360)) || (!(_SafeStr_4360.assets))) || (!(_SafeStr_4360.windowManager))))
            {
                return (null);
            };
            var _local_3:XmlAsset = (_SafeStr_4360.assets.getAssetByName(_arg_1) as XmlAsset);
            if (((!(_local_3)) || (!(_local_3.content))))
            {
                return (null);
            };
            var _local_2:XML = (_local_3.content as XML);
            if (!_local_2)
            {
                return (null);
            };
            return (_SafeStr_4360.windowManager.buildFromXML(_local_2));
        }


    }
}//package com.sulake.habbo.catalog.club

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


