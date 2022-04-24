// by nota

//com.sulake.habbo.catalog.viewer.MultiProductContainer

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.catalog._SafeStr_3141;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;

    public class MultiProductContainer extends SingleProductContainer 
    {

        public function MultiProductContainer(_arg_1:_SafeStr_3141, _arg_2:Vector.<_SafeStr_3151>, _arg_3:HabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override public function initProductIcon(_arg_1:IRoomEngine, _arg_2:IStuffData=null):void
        {
            super.initProductIcon(_arg_1);
            var _local_3:_SafeStr_3109 = _SafeStr_3882.findChildByName("multiContainer");
            if (_local_3)
            {
                _local_3.visible = true;
            };
            var _local_4:ITextWindow = (_SafeStr_3882.findChildByName("multiCounter") as ITextWindow);
            if (_local_4)
            {
                _local_4.text = ("x" + firstProduct.productCount);
            };
            this.setClubIconLevel(offer.clubLevel);
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)


