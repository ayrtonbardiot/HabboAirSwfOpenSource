// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qw._SafeStr_1590

package _-qw
{
    import com.sulake.habbo.room.IStuffData;

    [SecureSWF(rename="true")]
    public class _SafeStr_1590 
    {

        private var _offerId:int;
        private var _SafeStr_4318:int;
        private var _SafeStr_5973:int;
        private var _SafeStr_5974:String;
        private var _SafeStr_4601:IStuffData;
        private var _SafeStr_5178:int;
        private var _status:int;
        private var _SafeStr_5975:int = -1;
        private var _SafeStr_4865:int;
        private var _offerCount:int;

        public function _SafeStr_1590(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:IStuffData, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:int, _arg_10:int=-1)
        {
            _offerId = _arg_1;
            _SafeStr_4318 = _arg_2;
            _SafeStr_5973 = _arg_3;
            _SafeStr_5974 = _arg_4;
            _SafeStr_4601 = _arg_5;
            _SafeStr_5178 = _arg_6;
            _status = _arg_7;
            _SafeStr_5975 = _arg_8;
            _SafeStr_4865 = _arg_9;
            _offerCount = _arg_10;
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

        public function get status():int
        {
            return (_status);
        }

        public function get timeLeftMinutes():int
        {
            return (_SafeStr_5975);
        }

        public function get averagePrice():int
        {
            return (_SafeStr_4865);
        }

        public function get offerCount():int
        {
            return (_offerCount);
        }


    }
}//package _-qw

// _SafeStr_1590 = "_-X1g" (String#8781, DoABC#3)
// _SafeStr_4318 = "_-9J" (String#7188, DoABC#3)
// _SafeStr_4601 = "_-o1B" (String#9925, DoABC#3)
// _SafeStr_4865 = "_-O1l" (String#8159, DoABC#3)
// _SafeStr_5178 = "_-4G" (String#6846, DoABC#3)
// _SafeStr_5973 = "_-41S" (String#6824, DoABC#3)
// _SafeStr_5974 = "_-Wl" (String#8752, DoABC#3)
// _SafeStr_5975 = "_-9" (String#7148, DoABC#3)


