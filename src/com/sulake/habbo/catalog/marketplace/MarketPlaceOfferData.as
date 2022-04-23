// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.marketplace.MarketPlaceOfferData

package com.sulake.habbo.catalog.marketplace
{
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;

    public class MarketPlaceOfferData implements IMarketPlaceOfferData 
    {

        public static const _SafeStr_8317:int = 1;
        public static const _SafeStr_8318:int = 2;

        private var _offerId:int;
        private var _SafeStr_4318:int;
        private var _SafeStr_5973:int;
        private var _SafeStr_5974:String;
        private var _SafeStr_4601:IStuffData;
        private var _SafeStr_5178:int;
        private var _SafeStr_4865:int;
        private var _imageCallback:int;
        private var _status:int;
        private var _SafeStr_5975:int = -1;
        private var _offerCount:int;
        private var _SafeStr_4204:BitmapData;

        public function MarketPlaceOfferData(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:IStuffData, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int=-1)
        {
            _offerId = _arg_1;
            _SafeStr_4318 = _arg_2;
            _SafeStr_5973 = _arg_3;
            _SafeStr_5974 = _arg_4;
            _SafeStr_4601 = _arg_5;
            _SafeStr_5178 = _arg_6;
            _status = _arg_7;
            _SafeStr_4865 = _arg_8;
            _offerCount = _arg_9;
        }

        public function dispose():void
        {
            if (_SafeStr_4204)
            {
                _SafeStr_4204.dispose();
                _SafeStr_4204 = null;
            };
            if (_SafeStr_4601)
            {
                _SafeStr_4601 = null;
            };
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }

        public function get furniType():int
        {
            return (_SafeStr_5973);
        }

        public function get extraData():String
        {
            return (_SafeStr_5974);
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }

        public function get price():int
        {
            return (_SafeStr_5178);
        }

        public function get averagePrice():int
        {
            return (_SafeStr_4865);
        }

        public function get image():BitmapData
        {
            return (_SafeStr_4204);
        }

        public function set image(_arg_1:BitmapData):void
        {
            if (_SafeStr_4204 != null)
            {
                _SafeStr_4204.dispose();
            };
            _SafeStr_4204 = _arg_1;
        }

        public function set imageCallback(_arg_1:int):void
        {
            _imageCallback = _arg_1;
        }

        public function get imageCallback():int
        {
            return (_imageCallback);
        }

        public function get status():int
        {
            return (_status);
        }

        public function get timeLeftMinutes():int
        {
            return (_SafeStr_5975);
        }

        public function set timeLeftMinutes(_arg_1:int):void
        {
            _SafeStr_5975 = _arg_1;
        }

        public function set price(_arg_1:int):void
        {
            _SafeStr_5178 = _arg_1;
        }

        public function set offerId(_arg_1:int):void
        {
            _offerId = _arg_1;
        }

        public function get offerCount():int
        {
            return (_offerCount);
        }

        public function set offerCount(_arg_1:int):void
        {
            _offerCount = _arg_1;
        }

        public function get isUniqueLimitedItem():Boolean
        {
            return ((!(stuffData == null)) && (stuffData.uniqueSerialNumber > 0));
        }


    }
}//package com.sulake.habbo.catalog.marketplace

// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_4865 = "_-O1l" (String#9793, DoABC#4)
// _SafeStr_5178 = "_-4G" (String#7290, DoABC#4)
// _SafeStr_5973 = "_-41S" (String#20599, DoABC#4)
// _SafeStr_5974 = "_-Wl" (String#10041, DoABC#4)
// _SafeStr_5975 = "_-9" (String#21815, DoABC#4)
// _SafeStr_8317 = "_-Do" (String#22459, DoABC#4)
// _SafeStr_8318 = "_-I1f" (String#31206, DoABC#4)


