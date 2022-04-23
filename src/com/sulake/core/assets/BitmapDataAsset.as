// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.assets.BitmapDataAsset

package com.sulake.core.assets
{
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.display.Loader;
    import flash.display.Bitmap;
    import flash.utils.ByteArray;
    import com.codeazur.as3swf.tags.TagDefineBitsLossless2;
    import com.sulake.core.utils.images._SafeStr_976;
    import flash.events.Event;

    public class BitmapDataAsset implements ILazyAsset 
    {

        private static const CLONE_BITMAP_DATA:Boolean = false;
        private static const USE_ASYNC_LOADER:Boolean = false;
        private static const IMMEDIATE_PREPARE:Boolean = false;

        protected static var _SafeStr_8022:uint = 0;
        protected static var _SafeStr_8023:uint = 0;

        public var name:String;
        private var _disposed:Boolean = false;
        private var _rectangle:Rectangle;
        private var _SafeStr_8025:Object;
        private var _bitmap:BitmapData;
        private var _offset:Point = new Point(0, 0);
        private var _flipH:Boolean = false;
        private var _flipV:Boolean = false;
        private var _SafeStr_8024:AssetTypeDeclaration;
        private var _SafeStr_5275:String;
        private var _SafeStr_6780:Loader;
        private var _SafeStr_8026:Boolean = true;

        public function BitmapDataAsset(_arg_1:AssetTypeDeclaration, _arg_2:String=null)
        {
            _SafeStr_8024 = _arg_1;
            _SafeStr_5275 = _arg_2;
            _SafeStr_8022++;
        }

        public static function get instances():uint
        {
            return (_SafeStr_8022);
        }

        public static function get allocatedByteCount():uint
        {
            return (_SafeStr_8023);
        }


        public function get url():String
        {
            return (_SafeStr_5275);
        }

        public function get flipH():Boolean
        {
            return (_flipH);
        }

        public function get flipV():Boolean
        {
            return (_flipV);
        }

        public function get offset():Point
        {
            return (_offset);
        }

        public function get content():Object
        {
            if (!_bitmap)
            {
                prepareLazyContent();
            };
            return (_bitmap);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get rectangle():Rectangle
        {
            var _local_1:* = null;
            if (!_rectangle)
            {
                _local_1 = BitmapData(content);
                if (_local_1)
                {
                    _rectangle = _local_1.rect;
                };
            };
            return (_rectangle);
        }

        public function get declaration():AssetTypeDeclaration
        {
            return (_SafeStr_8024);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (!_disposed)
            {
                _SafeStr_8022--;
                if (_bitmap)
                {
                    try
                    {
                        _SafeStr_8023 = (_SafeStr_8023 - ((_bitmap.width * _bitmap.height) * 4));
                        if (_SafeStr_8026)
                        {
                            _bitmap.dispose();
                        };
                    }
                    catch(e:Error)
                    {
                    };
                };
                if ((_SafeStr_8025 is BitmapData))
                {
                    if (_SafeStr_8026)
                    {
                        (_SafeStr_8025 as BitmapData).dispose();
                    };
                }
                else
                {
                    if ((_SafeStr_8025 is Bitmap))
                    {
                        (_SafeStr_8025 as Bitmap).bitmapData.dispose();
                    }
                    else
                    {
                        if ((_SafeStr_8025 is ByteArray))
                        {
                            (_SafeStr_8025 as ByteArray).clear();
                        }
                        else
                        {
                            if ((_SafeStr_8025 is TagDefineBitsLossless2))
                            {
                                _local_1 = (_SafeStr_8025 as TagDefineBitsLossless2).zlibBitmapData;
                                if (_local_1)
                                {
                                    _local_1.clear();
                                };
                            };
                        };
                    };
                };
                _SafeStr_8025 = null;
                _bitmap = null;
                _offset = null;
                _SafeStr_8024 = null;
                _SafeStr_5275 = null;
                _rectangle = null;
                _disposed = true;
            };
        }

        public function setUnknownContent(_arg_1:Object):void
        {
            if (_arg_1 == null)
            {
            };
            if (_bitmap)
            {
                if (_bitmap == (_arg_1 as BitmapData))
                {
                    return;
                };
                if (_SafeStr_8026)
                {
                    _bitmap.dispose();
                };
            };
            _SafeStr_8025 = _arg_1;
            _bitmap = null;
        }

        public function prepareLazyContent():void
        {
            var _local_13:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_10:* = null;
            var _local_11:* = null;
            var _local_12:uint;
            var _local_9:int;
            var _local_6:int;
            var _local_4:int;
            var _local_2:int;
            var _local_1:Number;
            var _local_7:int;
            var _local_8:int;
            if (_SafeStr_8025 == null)
            {
                return;
            };
            if ((_SafeStr_8025 is Class))
            {
                _local_13 = new ((_SafeStr_8025 as Class))();
                _local_5 = (_local_13 as Bitmap);
                if (_local_5 != null)
                {
                    _bitmap = _local_5.bitmapData;
                    _local_5.bitmapData = null;
                    if (_bitmap != null)
                    {
                        _SafeStr_8023 = (_SafeStr_8023 + ((_bitmap.width * _bitmap.height) * 4));
                        _SafeStr_8025 = null;
                        return;
                    };
                    (trace(("Could not convert Bitmap: " + url)));
                    _local_13 = new BitmapData(20, 20, true, 0xFF0000);
                };
                _bitmap = (_local_13 as BitmapData);
                if (_bitmap != null)
                {
                    _SafeStr_8025 = null;
                    return;
                };
                (trace(("Could not convert BitmapData: " + url)));
            };
            if ((_SafeStr_8025 is Bitmap))
            {
                _local_3 = Bitmap(_SafeStr_8025);
                _bitmap = _local_3.bitmapData;
                if (_bitmap != null)
                {
                    _SafeStr_8025 = null;
                }
                else
                {
                    throw (new Error("Failed to convert Bitmap to BitmapDataAsset!"));
                };
            };
            if ((_SafeStr_8025 is BitmapData))
            {
                _bitmap = (_SafeStr_8025 as BitmapData);
                if (_bitmap != null)
                {
                    _SafeStr_8025 = null;
                    return;
                };
                throw (new Error("Failed to convert BitmapData to BitmapDataAsset!"));
            };
            if ((_SafeStr_8025 is BitmapDataAsset))
            {
                _bitmap = BitmapDataAsset(_SafeStr_8025)._bitmap;
                _offset = BitmapDataAsset(_SafeStr_8025)._offset;
                _flipH = BitmapDataAsset(_SafeStr_8025)._flipH;
                _flipV = BitmapDataAsset(_SafeStr_8025)._flipV;
                if (_bitmap != null)
                {
                    _SafeStr_8025 = null;
                    return;
                };
                throw (new Error("Failed to read content from BitmapDataAsset!"));
            };
            if ((_SafeStr_8025 is TagDefineBitsLossless2))
            {
                _local_10 = (_SafeStr_8025 as TagDefineBitsLossless2);
                _local_11 = AssetLibrary.cloneBytes((_local_10.zlibBitmapData as ByteArray));
                _local_11.uncompress();
                _bitmap = new BitmapData(_local_10.bitmapWidth, _local_10._SafeStr_3544, true, 0xFFFFFFFF);
                _local_12 = 0;
                _bitmap.lock();
                _local_7 = 0;
                while (_local_7 < _local_10._SafeStr_3544)
                {
                    _local_8 = 0;
                    while (_local_8 < _local_10.bitmapWidth)
                    {
                        _local_12 = _local_11.readUnsignedInt();
                        _local_9 = ((_local_12 & 0xFF0000) >> 16);
                        _local_6 = ((_local_12 & 0xFF00) >> 8);
                        _local_4 = (_local_12 & 0xFF);
                        _local_2 = ((_local_12 / 2) >> 23);
                        if (((!(_local_2 == 0xFF)) && (!(_local_2 == 0))))
                        {
                            _local_1 = (_local_2 / 0xFF);
                            _local_9 = int(Math.min(0xFF, (_local_9 / _local_1)));
                            _local_6 = int(Math.min(0xFF, (_local_6 / _local_1)));
                            _local_4 = int(Math.min(0xFF, (_local_4 / _local_1)));
                        };
                        _bitmap.setPixel32(_local_8, _local_7, ((((_local_2 << 24) | (_local_9 << 16)) | (_local_6 << 8)) | _local_4));
                        _local_8++;
                    };
                    _local_7++;
                };
                _bitmap.unlock();
                _SafeStr_8025 = null;
            };
            if ((_SafeStr_8025 is ByteArray))
            {
                try
                {
                    _bitmap = new _SafeStr_976().decode((_SafeStr_8025 as ByteArray));
                }
                catch(e:Error)
                {
                    _SafeStr_14.log(((("Error decoding asset content to PNG: " + url) + "::") + name));
                };
                _SafeStr_8025 = null;
            };
        }

        private function onLoaderComplete(_arg_1:Event):void
        {
            var _local_2:Loader = (_arg_1.currentTarget.loader as Loader);
            var _local_3:Bitmap = (_local_2.content as Bitmap);
            _bitmap = _local_3.bitmapData;
            if (((_SafeStr_6780) && (_SafeStr_6780.contentLoaderInfo)))
            {
                _SafeStr_6780.contentLoaderInfo.removeEventListener("complete", onLoaderComplete);
            };
            _SafeStr_6780 = null;
        }

        public function setFromOtherAsset(_arg_1:IAsset):void
        {
            if ((_arg_1 is BitmapDataAsset))
            {
                _bitmap = BitmapDataAsset(_arg_1)._bitmap;
                _offset = BitmapDataAsset(_arg_1)._offset;
            }
            else
            {
                throw (new Error("Provided asset should be of type BitmapDataAsset!"));
            };
        }

        public function setParamsDesc(_arg_1:XMLList):void
        {
            var _local_3:* = null;
            var _local_5:* = null;
            for each (var _local_2:XML in _arg_1)
            {
                _local_5 = _local_2.attribute("key");
                var _local_4:String = _local_2.attribute("value");
                switch (_local_5)
                {
                    case "offset":
                        _local_3 = _local_4.split(",");
                        _offset.x = parseInt(_local_3[0]);
                        _offset.y = parseInt(_local_3[1]);
                        break;
                    case "region":
                        _local_3 = _local_4.split(",");
                        if (!_rectangle)
                        {
                            _rectangle = new Rectangle();
                        };
                        _rectangle.x = parseInt(_local_3[0]);
                        _rectangle.y = parseInt(_local_3[1]);
                        _rectangle.width = parseInt(_local_3[2]);
                        _rectangle.height = parseInt(_local_3[3]);
                        break;
                    case "flipH":
                        _flipH = ((_local_4 == "1") || (_local_4 == "true"));
                        break;
                    case "flipV":
                        _flipV = ((_local_4 == "1") || (_local_4 == "true"));
                };
            };
        }


    }
}//package com.sulake.core.assets

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_3544 = "_-Zl" (String#8948, DoABC#3)
// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_6780 = "_-Y1l" (String#8851, DoABC#3)
// _SafeStr_8022 = "_-7j" (String#7056, DoABC#3)
// _SafeStr_8023 = "_-K19" (String#7864, DoABC#3)
// _SafeStr_8024 = "_-p0" (String#9968, DoABC#3)
// _SafeStr_8025 = "_-AK" (String#7278, DoABC#3)
// _SafeStr_8026 = "_-g1J" (String#9392, DoABC#3)
// _SafeStr_976 = "_-r11" (String#10110, DoABC#3)


