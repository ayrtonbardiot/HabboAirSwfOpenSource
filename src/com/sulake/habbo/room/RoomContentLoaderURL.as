// by nota

//com.sulake.habbo.room.RoomContentLoaderURL

package com.sulake.habbo.room
{
    public class RoomContentLoaderURL implements IRoomContentLoaderURL 
    {

        private static const FILE_TYPE_PNG:String = "png";
        private static const FILE_TYPE_JPG:String = "png";
        private static const CACHE_KEY_FURNI_PREFIX:String = "furni/";
        private static const CACHE_KEY_ICON_PREFIX:String = "icon/";

        private var _SafeStr_5275:String;
        private var _cacheKey:String;
        private var _cacheRevision:String;
        private var _assetName:String;
        private var _SafeStr_5649:String;

        public function RoomContentLoaderURL(_arg_1:String, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false, _arg_5:String=null)
        {
            _SafeStr_5275 = _arg_1;
            var _local_7:String = ((_arg_4) ? "icon/" : "furni/");
            _cacheKey = ((_arg_2) ? (_local_7 + _arg_2) : null);
            _cacheRevision = _arg_3;
            _assetName = _arg_5;
            var _local_6:String = _arg_1.toLowerCase();
            if (_local_6.indexOf(".png") > -1)
            {
                _SafeStr_5649 = "png";
            }
            else
            {
                if (_local_6.indexOf(".jpg") > -1)
                {
                    _SafeStr_5649 = "png";
                }
                else
                {
                    if (_local_6.indexOf(".jpeg") > -1)
                    {
                        _SafeStr_5649 = "png";
                    };
                };
            };
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get cacheKey():String
        {
            return (_cacheKey);
        }

        public function get cacheRevision():String
        {
            return (_cacheRevision);
        }

        public function get assetName():String
        {
            return (_assetName);
        }

        public function get fileType():String
        {
            return (_SafeStr_5649);
        }


    }
}//package com.sulake.habbo.room

// _SafeStr_5275 = "_-J1N" (String#2314, DoABC#4)
// _SafeStr_5649 = "_-H19" (String#9039, DoABC#4)


