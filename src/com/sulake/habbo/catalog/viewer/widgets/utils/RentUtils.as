// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.widgets.utils.RentUtils

package com.sulake.habbo.catalog.viewer.widgets.utils
{
    import com.sulake.habbo.catalog._SafeStr_3141;
    import com.sulake.core.window._SafeStr_3109;

    public class RentUtils 
    {


        public static function updateBuyCaption(_arg_1:_SafeStr_3141, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1 == null) || (_arg_2 == null)))
            {
                return;
            };
            _arg_2.caption = ((_arg_1.isRentOffer) ? "${catalog.purchase_confirmation.rent}" : "${catalog.purchase_confirmation.buy}");
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets.utils

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)


