// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.air.FileProxy

package com.sulake.air
{
    import com.sulake.core.utils._SafeStr_68;
    import flash.utils.Dictionary;
    import flash.filesystem.*;
    import flash.display.Loader;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.events.IOErrorEvent;
    import flash.events.ErrorEvent;

    public class FileProxy implements _SafeStr_68 
    {

        private static const LOCAL_FILE_PATH:String = "local_include/";
        private static const CACHE_PATH:String = "com.sulake.habbo/";
        private static const SWAP_FILE_PATH:String = "com.sulake.habbo/swap/swap_";

        private static var _SafeStr_3695:int = 0;

        private var _SafeStr_3694:Dictionary;


        private static function resolveFileFromLocalPath(_arg_1:String):String
        {
            if (!_arg_1)
            {
                return (null);
            };
            var _local_2:int = _arg_1.indexOf("local_include/");
            if (_local_2 != -1)
            {
                return (_arg_1.substr((_local_2 + "local_include/".length)));
            };
            return (_arg_1);
        }


        public function dispose():void
        {
            _SafeStr_3694 = null;
        }

        public function clearCache():void
        {
            deleteCacheDirectory("");
        }

        public function localFilePath(_arg_1:String):String
        {
            var _local_2:File = File.applicationDirectory.resolvePath(("local_include/" + _arg_1));
            return (_local_2.url);
        }

        public function cacheFilePath(_arg_1:String):String
        {
            var _local_2:File = File.cacheDirectory.resolvePath(("com.sulake.habbo/" + _arg_1));
            return (_local_2.url);
        }

        public function loadLocalBitmapData(_arg_1:String, _arg_2:Function):void
        {
            addCallback(_arg_1, _arg_2);
            var _local_3:Loader = new Loader();
            _local_3.contentLoaderInfo.addEventListener("complete", onLocalFileComplete);
            _local_3.contentLoaderInfo.addEventListener("error", onLocalFileError);
            _local_3.contentLoaderInfo.addEventListener("ioError", onLocalFileError);
            _local_3.load(new URLRequest(localFilePath(_arg_1)));
        }

        public function cacheFileExists(_arg_1:String):Boolean
        {
            var _local_2:* = null;
            try
            {
                if (!File.cacheDirectory)
                {
                    var _local_4:Boolean = false;
                    return (_local_4);
                };
                _local_2 = File.cacheDirectory.resolvePath(("com.sulake.habbo/" + _arg_1));
                if (((_local_2) && (_local_2.exists)))
                {
                    var _local_5:Boolean = true;
                    return (_local_5);
                };
            }
            catch(e:Error)
            {
                return (false);
            };
            return (false);
        }

        public function localFileExists(_arg_1:String):Boolean
        {
            var _local_2:* = null;
            try
            {
                _local_2 = File.applicationDirectory.resolvePath(("local_include/" + _arg_1));
                if (((_local_2) && (_local_2.exists)))
                {
                    var _local_4:Boolean = true;
                    return (_local_4);
                };
            }
            catch(e:Error)
            {
                return (false);
            };
            return (false);
        }

        public function readCache(_arg_1:String):ByteArray
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            try
            {
                if (!File.cacheDirectory)
                {
                    var _local_6:* = null;
                    return (_local_6);
                };
                _local_2 = File.cacheDirectory.resolvePath(("com.sulake.habbo/" + _arg_1));
                if (((!(_local_2)) || (!(_local_2.exists))))
                {
                    var _local_7:* = null;
                    return (_local_7);
                };
                _SafeStr_14.log(("[FileProxy] Read file " + _local_2.nativePath));
                _local_4 = new ByteArray();
                _local_3 = new FileStream();
                _local_3.open(_local_2, "read");
                _local_3.readBytes(_local_4);
                _local_3.close();
                var _local_8:* = _local_4;
                return (_local_8);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[FileProxy] File reading error: " + e));
            };
            return (null);
        }

        public function readCacheAsync(_arg_1:String, _arg_2:Function):void
        {
            var path = _arg_1;
            var callback = _arg_2;
            try
            {
                if (!File.cacheDirectory)
                {
                    callback(null); //not popped
                    return;
                };
                var file:File = File.cacheDirectory.resolvePath(("com.sulake.habbo/" + path));
                if (((!(file)) || (!(file.exists))))
                {
                    callback(null); //not popped
                    return;
                };
                _SafeStr_14.log(("[FileProxy] Read file " + file.nativePath));
                var stream:FileStream = new FileStream();
                stream.openAsync(file, "read");
                stream.addEventListener("complete", function (_arg_1:Event):void
                {
                    var _local_2:ByteArray = new ByteArray();
                    stream.readBytes(_local_2);
                    (callback(_local_2));
                    stream.close();
                });
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[FileProxy] File reading error: " + e));
                (callback(null));
            };
        }

        public function writeCache(_arg_1:String, _arg_2:ByteArray):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            try
            {
                if (!File.cacheDirectory)
                {
                    return;
                };
                _local_3 = File.cacheDirectory.resolvePath(("com.sulake.habbo/" + _arg_1));
                _local_4 = new FileStream();
                _local_4.open(_local_3, "write");
                _local_4.writeBytes(_arg_2);
                _local_4.close();
                _SafeStr_14.log(("[FileProxy] Wrote file " + _local_3.nativePath));
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[FileProxy] File writing error: " + e));
            };
        }

        public function writeCacheAsync(_arg_1:String, _arg_2:ByteArray):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            try
            {
                if (!File.cacheDirectory)
                {
                    return;
                };
                _local_3 = File.cacheDirectory.resolvePath(("com.sulake.habbo/" + _arg_1));
                _local_4 = new FileStream();
                _local_4.openAsync(_local_3, "write");
                _local_4.writeBytes(_arg_2);
                _local_4.close();
                _SafeStr_14.log(("[FileProxy] Wrote file " + _local_3.nativePath));
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[FileProxy] File writing error: " + e));
            };
        }

        public function deleteCacheDirectory(_arg_1:String):void
        {
            var _local_2:* = null;
            try
            {
                if (!File.cacheDirectory)
                {
                    return;
                };
                _local_2 = File.cacheDirectory.resolvePath(("com.sulake.habbo/" + _arg_1));
                if (((_local_2.exists) && (_local_2.isDirectory)))
                {
                    _local_2.deleteDirectory(true);
                    _SafeStr_14.log(("[FileProxy] Deleted directory " + _local_2.nativePath));
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[FileProxy] File deleting error: " + e));
            };
        }

        private function onLocalFileComplete(_arg_1:Event):void
        {
            var _local_2:String = resolveFileFromLocalPath(_arg_1.target.url);
            var _local_3:BitmapData = (_arg_1.target.content as Bitmap).bitmapData;
            doCallbacks(_local_2, _local_3);
        }

        private function onLocalFileError(_arg_1:Event):void
        {
            var _local_3:* = null;
            var _local_2:String = resolveFileFromLocalPath(_arg_1.target.url);
            if (_arg_1.type == "ioError")
            {
                _local_3 = ("IOError: " + (_arg_1 as IOErrorEvent).text);
            }
            else
            {
                if ((_arg_1 is ErrorEvent))
                {
                    _local_3 = (((("Error: " + (_arg_1 as ErrorEvent).errorID) + "(") + _local_2) + ")");
                }
                else
                {
                    _local_3 = _arg_1.toString();
                };
            };
            _SafeStr_14.log(("[FileProxy] Error when accessing local file! " + _local_3));
            doCallbacks(_local_2, null);
        }

        private function addCallback(_arg_1:String, _arg_2:Function):void
        {
            if (!_SafeStr_3694)
            {
                _SafeStr_3694 = new Dictionary();
            };
            var _local_3:Array = _SafeStr_3694[_arg_1];
            if (!_local_3)
            {
                _local_3 = [];
                _SafeStr_3694[_arg_1] = _local_3;
            };
            _local_3.push(_arg_2);
        }

        private function doCallbacks(_arg_1:String, _arg_2:BitmapData):void
        {
            if (!_SafeStr_3694)
            {
                return;
            };
            var _local_4:Array = _SafeStr_3694[_arg_1];
            if (!_local_4)
            {
                return;
            };
            for each (var _local_3:Function in _local_4)
            {
                if (_local_3 != null)
                {
                    if (_arg_2)
                    {
                        (_local_3(_arg_2.clone()));
                    }
                    else
                    {
                        (_local_3(null));
                    };
                };
            };
            if (_arg_2)
            {
                _arg_2.dispose();
            };
            delete _SafeStr_3694[_arg_1]; //not popped
        }

        public function swapObjectToDisk(_arg_1:Object):int
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:int = -1;
            try
            {
                if (File.cacheDirectory)
                {
                    _local_4 = ++_SafeStr_3695;
                    _local_2 = File.cacheDirectory.resolvePath(("com.sulake.habbo/swap/swap_" + _local_4));
                    _local_3 = new FileStream();
                    _local_3.open(_local_2, "write");
                    _local_3.writeObject(_arg_1);
                    _local_3.close();
                };
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[FileProxy] Swap in error: " + e));
                _local_4 = -1;
            };
            return (_local_4);
        }

        public function swapObjectFromDisk(_arg_1:int):Object
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            try
            {
                if (!File.cacheDirectory)
                {
                    var _local_7:* = null;
                    return (_local_7);
                };
                _local_2 = ("com.sulake.habbo/swap/swap_" + _arg_1);
                _local_3 = File.cacheDirectory.resolvePath(_local_2);
                if (((!(_local_3)) || (!(_local_3.exists))))
                {
                    var _local_8:* = null;
                    return (_local_8);
                };
                _local_4 = new FileStream();
                _local_4.open(_local_3, "read");
                _local_5 = _local_4.readObject();
                _local_4.close();
                _local_3.deleteFileAsync();
                var _local_9:* = _local_5;
                return (_local_9);
            }
            catch(e:Error)
            {
                _SafeStr_14.log(("[FileProxy] Swap out error: " + e));
            };
            return (null);
        }


    }
}//package com.sulake.air

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3694 = "_-b" (String#6814, DoABC#4)
// _SafeStr_3695 = "_-k1a" (String#17679, DoABC#4)
// _SafeStr_68 = "_-H1s" (String#30500, DoABC#4)


