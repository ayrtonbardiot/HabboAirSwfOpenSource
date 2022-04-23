// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.viewer.FurniProductContainer

package com.sulake.habbo.catalog.viewer
{
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.catalog._SafeStr_3141;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;

    public class FurniProductContainer extends ProductContainer 
    {

        private var _SafeStr_3867:_SafeStr_3130;

        public function FurniProductContainer(_arg_1:_SafeStr_3141, _arg_2:Vector.<_SafeStr_3151>, _arg_3:HabboCatalog, _arg_4:_SafeStr_3130)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3867 = _arg_4;
        }

        override public function initProductIcon(_arg_1:IRoomEngine, _arg_2:IStuffData=null):void
        {
            var _local_3:* = null;
            switch (_SafeStr_3867.type)
            {
                case "s":
                    _local_3 = catalog.roomEngine.getFurnitureIcon(_SafeStr_3867.id, this);
                    break;
                case "i":
                    _local_3 = catalog.roomEngine.getWallItemIcon(_SafeStr_3867.id, this);
            };
            if (_local_3)
            {
                setIconImage(_local_3.data, true);
            };
        }

        override public function activate():void
        {
            super.activate();
            if (((_SafeStr_3867.rentOfferId > -1) && (!(catalog.catalogType == "BUILDERS_CLUB"))))
            {
                catalog.sendGetProductOffer(_SafeStr_3867.rentOfferId);
            }
            else
            {
                catalog.sendGetProductOffer(_SafeStr_3867.purchaseOfferId);
            };
        }

        override public function get isLazy():Boolean
        {
            return (true);
        }


    }
}//package com.sulake.habbo.catalog.viewer

// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3141 = "_-MT" (String#715, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3867 = "_-Vs" (String#1371, DoABC#4)


