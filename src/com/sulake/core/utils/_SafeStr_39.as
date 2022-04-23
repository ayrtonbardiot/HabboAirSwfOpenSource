// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils._SafeStr_39

package com.sulake.core.utils
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.net.URLLoader;
    import flash.system.LoaderContext;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.system.ApplicationDomain;
    import com.sulake.core._SafeStr_79;
    import com.codeazur.as3swf.SWF;
    import flash.utils.Dictionary;
    import __AS3__.vec.Vector;
    import com.codeazur.as3swf.tags.ITag;
    import com.codeazur.as3swf.tags.TagSymbolClass;
    import com.codeazur.as3swf.tags.TagDefineBinaryData;
    import com.codeazur.as3swf.tags.TagDefineBitsLossless2;
    import flash.utils.getTimer;
    import flash.display.DisplayObject;
    import flash.system.System;
    import flash.events.Event;
    import flash.utils.Timer;
    import flash.events.HTTPStatusEvent;
    import flash.events.TimerEvent;
    import flash.display.MovieClip;
    import flash.display.FrameLabel;

    [SecureSWF(rename="true")]
    public class _SafeStr_39 extends EventDispatcherWrapper implements _SafeStr_13 
    {

        protected static const STATE_EVENT_COMPLETE:uint = 1;
        protected static const STATE_EVENT_INIT:uint = 2;
        protected static const STATE_ANALYZE:uint = 3;
        protected static const STATE_EVENT_FRAME:uint = 4;
        protected static const STATE_EVENT_OPEN:uint = 2;
        protected static const STATE_READY:uint = 7;
        public static const DEFAULT_MAX_RETRIES:int = 5;
        public static const LIBRARY_LOADER_FINALIZE:String = "LIBRARY_LOADER_FINALIZE";
        private static const CACHE_FILE_NAME:String = "asset.swf";
        public static const USE_DOWNLOAD_THROTTLING:Boolean = true;
        public static const MAX_SIMULTANEOUS_DOWNLOADS:int = 6;

        private static var _SafeStr_8084:Array = [];
        private static var _SafeStr_8085:Array = [];

        protected var _SafeStr_8083:URLLoader;
        protected var _context:LoaderContext;
        protected var _status:int = 0;
        protected var _SafeStr_8086:URLRequest;
        protected var _manifest:XML;
        protected var _SafeStr_8009:Class;
        protected var _process:uint = 0;
        protected var _name:String;
        protected var _SafeStr_4211:Boolean = false;
        protected var _SafeStr_4414:Boolean = false;
        protected var _paused:Boolean = false;
        protected var _errorMsg:String = "";
        protected var _debugMsg:String = "";
        protected var _cachedBytes:ByteArray;
        protected var _downloadStartTime:int;
        protected var _downloadEndTime:int;
        protected var _downloadRetriesLeft:int;
        protected var _SafeStr_8087:uint = 0;
        protected var _cacheKey:String;
        protected var _cacheRevision:String;

        public function _SafeStr_39(_arg_1:LoaderContext=null, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            if (_arg_1 == null)
            {
                _context = new LoaderContext();
                _context.applicationDomain = ApplicationDomain.currentDomain;
            }
            else
            {
                _context = _arg_1;
            };
            _paused = _arg_2;
            _SafeStr_4414 = _arg_3;
            _status = 0;
            _SafeStr_8083 = new URLLoader();
            _SafeStr_8083.dataFormat = "binary";
            _SafeStr_8083.addEventListener("open", loadEventHandler);
            _SafeStr_8083.addEventListener("complete", loadEventHandler);
            _SafeStr_8083.addEventListener("progress", loadEventHandler);
            _SafeStr_8083.addEventListener("unload", loadEventHandler);
            _SafeStr_8083.addEventListener("httpStatus", loadEventHandler);
            _SafeStr_8083.addEventListener("ioError", loadEventHandler);
            _SafeStr_8083.addEventListener("securityError", loadEventHandler);
        }

        private static function get fileProxy():_SafeStr_68
        {
            return (_SafeStr_79.instance.fileProxy);
        }

        public static function makeSWF(_arg_1:String, _arg_2:ByteArray, _arg_3:Class):ByteArray
        {
            var _local_6:int;
            var _local_8:* = null;
            var _local_10:* = null;
            var _local_5:SWF = new SWF();
            _local_5.loadBytes(_arg_2);
            var _local_11:Dictionary = getSymbolClassList(_local_5, _arg_1);
            var _local_12:Dictionary = getBinaryBlobs(_local_5);
            var _local_4:Dictionary = getLosslessImageBlobs(_local_5);
            _local_5.dispose();
            for (var _local_9:String in _local_11)
            {
                _local_6 = _local_11[_local_9];
                _local_8 = _local_12[_local_6];
                _local_10 = _local_4[_local_6];
                if (_local_8)
                {
                    _arg_3[_local_9] = _local_8.binaryData;
                }
                else
                {
                    if (_local_10)
                    {
                        _arg_3[_local_9] = _local_10;
                    };
                };
            };
            var _local_7:ByteArray = _arg_3["manifest"];
            if (((_local_7 == null) || (_local_7.length == 0)))
            {
                _local_7 = _arg_3[(_arg_1 + "_manifest")];
            };
            if (((_local_7 == null) || (_local_7.length == 0)))
            {
            };
            return (_local_7);
        }

        private static function getSymbolClassList(_arg_1:SWF, _arg_2:String):Dictionary
        {
            var _local_7:int;
            var _local_15:* = null;
            var _local_9:* = null;
            var _local_10:*;
            var _local_13:int;
            var _local_8:int;
            var _local_4:* = null;
            var _local_14:* = null;
            var _local_3:Dictionary = new Dictionary();
            var _local_6:String = (_arg_2 + "_");
            var _local_11:String = "";
            var _local_12:Vector.<ITag> = _arg_1.tags;
            var _local_5:int = _local_12.length;
            _local_7 = 0;
            while (_local_7 < _local_5)
            {
                _local_15 = _local_12[_local_7];
                _local_9 = (_local_15 as TagSymbolClass);
                if (_local_9)
                {
                    _local_10 = _local_9.symbols;
                    _local_13 = _local_10.length;
                    _local_8 = 0;
                    while (_local_8 < _local_13)
                    {
                        _local_4 = _local_10[_local_8];
                        _local_14 = _local_4.name.replace(_local_6, _local_11);
                        if (_local_3[_local_14] != null)
                        {
                            _SafeStr_14.log(((("Warning, downloaded swf (" + _arg_2) + ") contains duplicate symbol: ") + _local_14));
                        };
                        _local_3[_local_14] = _local_4._SafeStr_3543;
                        _local_8++;
                    };
                    return (_local_3);
                };
                _local_7++;
            };
            return (_local_3);
        }

        private static function getBinaryBlobs(_arg_1:SWF):Dictionary
        {
            var _local_3:* = null;
            var _local_5:int;
            var _local_6:* = null;
            var _local_2:Dictionary = new Dictionary();
            var _local_7:Vector.<ITag> = _arg_1.tags;
            var _local_4:int = _local_7.length;
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_6 = _local_7[_local_5];
                _local_3 = (_local_6 as TagDefineBinaryData);
                if (_local_3)
                {
                    _local_2[_local_3.characterId] = _local_3;
                };
                _local_5++;
            };
            return (_local_2);
        }

        private static function getLosslessImageBlobs(_arg_1:SWF):Dictionary
        {
            var _local_3:* = null;
            var _local_5:int;
            var _local_6:* = null;
            var _local_2:Dictionary = new Dictionary();
            var _local_7:Vector.<ITag> = _arg_1.tags;
            var _local_4:int = _local_7.length;
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_6 = _local_7[_local_5];
                _local_3 = (_local_6 as TagDefineBitsLossless2);
                if (_local_3)
                {
                    _local_2[_local_3.characterId] = _local_3;
                };
                _local_5++;
            };
            return (_local_2);
        }

        protected static function addRequestCounterToUrlRequest(_arg_1:URLRequest, _arg_2:int):void
        {
            var _local_3:int;
            var _local_6:* = null;
            if (((_arg_1.url == null) || (_arg_1.url == "")))
            {
                return;
            };
            var _local_4:Array = _arg_1.url.split("?");
            var _local_5:String = _local_4[0];
            var _local_9:String = ((_local_4.length > 1) ? _local_4[1] : "");
            var _local_7:String = "counterparameter";
            var _local_10:Array = _local_9.split("&");
            var _local_8:Boolean;
            _local_3 = 0;
            while (_local_3 < _local_10.length)
            {
                _local_6 = _local_10[_local_3];
                if (_local_6.indexOf((_local_7 + "=")) >= 0)
                {
                    _local_6 = ((_local_7 + "=") + _arg_2.toString());
                    _local_10[_local_3] = _local_6;
                    _local_8 = true;
                    break;
                };
                _local_3++;
            };
            if (!_local_8)
            {
                _local_10.push(((_local_7 + "=") + _arg_2));
            };
            _local_3 = 0;
            while (_local_3 < _local_10.length)
            {
                _local_5 = (_local_5 + (((_local_3 == 0) ? "?" : "&") + _local_10[_local_3]));
                _local_3++;
            };
            _arg_1.url = _local_5;
        }

        protected static function parseNameFromUrl(_arg_1:String):String
        {
            var _local_2:int;
            _local_2 = _arg_1.indexOf("?", 0);
            if (_local_2 > -1)
            {
                _arg_1 = _arg_1.slice(0, _local_2);
            };
            _local_2 = _arg_1.lastIndexOf(".");
            if (_local_2 > -1)
            {
                _arg_1 = _arg_1.slice(0, _local_2);
            };
            _local_2 = _arg_1.lastIndexOf("/");
            if (_local_2 > -1)
            {
                _arg_1 = _arg_1.slice((_local_2 + 1), _arg_1.length);
            };
            return (_arg_1);
        }

        protected static function queue(_arg_1:_SafeStr_39):void
        {
            if (_SafeStr_8084.indexOf(_arg_1) == -1)
            {
                _SafeStr_8084.push(_arg_1);
            };
            throttle();
        }

        protected static function throttle():void
        {
            var _local_1:* = null;
            var _local_2:int;
            _local_2 = (_SafeStr_8085.length - 1);
            while (_local_2 > -1)
            {
                _local_1 = (_SafeStr_8085[_local_2] as _SafeStr_39);
                if (((_local_1) && ((_local_1.ready) || (_local_1.disposed))))
                {
                    _SafeStr_8085.splice(_local_2, 1);
                };
                _local_2--;
            };
            while (((_SafeStr_8085.length < 6) && (_SafeStr_8084.length > 0)))
            {
                _local_1 = (_SafeStr_8084.shift() as _SafeStr_39);
                if (((!(_local_1.ready)) && (!(_local_1.disposed))))
                {
                    _SafeStr_8085.push(_local_1);
                    _local_1._SafeStr_8083.load(_local_1._SafeStr_8086);
                };
            };
        }


        public function get url():String
        {
            return ((_SafeStr_8086) ? _SafeStr_8086.url : null);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get ready():Boolean
        {
            return (_SafeStr_4211);
        }

        public function get status():int
        {
            return (_status);
        }

        public function get domain():ApplicationDomain
        {
            return (_context.applicationDomain);
        }

        public function get request():URLRequest
        {
            return (_SafeStr_8086);
        }

        public function get resource():Class
        {
            return (_SafeStr_8009);
        }

        public function get manifest():XML
        {
            return (_manifest);
        }

        public function get bytesTotal():uint
        {
            return (_SafeStr_8083.bytesTotal);
        }

        public function get bytesLoaded():uint
        {
            return (_SafeStr_8083.bytesLoaded);
        }

        public function get elapsedTime():uint
        {
            return ((_SafeStr_4211) ? (_downloadEndTime - _downloadStartTime) : (getTimer() - _downloadStartTime));
        }

        public function get paused():Boolean
        {
            return (_paused);
        }

        protected function get content():DisplayObject
        {
            if (_SafeStr_880.get(_name))
            {
                return (_SafeStr_880.get(_name) as DisplayObject);
            };
            return (null);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                dispatchEvent(new _SafeStr_43("LIBRARY_LOADER_EVENT_DISPOSE", _status, bytesTotal, bytesLoaded, elapsedTime));
                try
                {
                    _SafeStr_8083.close();
                }
                catch(e:Error)
                {
                };
                if (((_SafeStr_8083) && (_SafeStr_8083.data is ByteArray)))
                {
                    (_SafeStr_8083.data as ByteArray).clear();
                };
                _SafeStr_8083 = null;
                _context = null;
                _SafeStr_8009 = null;
                System.disposeXML(_manifest);
                _manifest = null;
                if (_cachedBytes)
                {
                    _cachedBytes.clear();
                    _cachedBytes = null;
                };
                super.dispose();
            };
        }

        public function load(_arg_1:URLRequest, _arg_2:String=null, _arg_3:String=null, _arg_4:int=5):void
        {
            var request = _arg_1;
            var cacheKey = _arg_2;
            var cacheRevision = _arg_3;
            var maxRetryCount = _arg_4;
            _SafeStr_8086 = internal::request;
            _name = parseNameFromUrl(_SafeStr_8086.url);
            _SafeStr_4211 = false;
            _downloadRetriesLeft = maxRetryCount;
            _cacheKey = cacheKey;
            _cacheRevision = cacheRevision;
            if (((((fileProxy) && (cacheKey)) && (cacheRevision)) && (!(cacheRevision == "-1"))))
            {
                var path:String = getCacheFilePath();
                ErrorReportStorage.addDebugData("Library cached", ("Library cached " + fileProxy.cacheFileExists(path)));
                fileProxy.readCacheAsync(path, function (_arg_1:ByteArray):void
                {
                    if (((!(_arg_1 == null)) && (_arg_1.length > 0)))
                    {
                        _cachedBytes = _arg_1;
                        _process = 7;
                        loadEventHandler(new Event("complete"));
                        return;
                    };
                    if (_cachedBytes)
                    {
                        _cachedBytes.clear();
                        _cachedBytes = null;
                    };
                    if (!_paused)
                    {
                        _paused = true;
                        resume();
                    };
                });
                return;
            };
            ErrorReportStorage.addDebugData("Library url", ("Library url " + internal::request.url));
            ErrorReportStorage.addDebugData("Library name", ("Library name " + _name));
            if (!_paused)
            {
                _paused = true;
                resume();
            };
        }

        private function getCacheFilePath():String
        {
            return ((((_cacheKey + "/") + _cacheRevision) + "/") + "asset.swf");
        }

        private function getCacheDirectoryPath():String
        {
            return (_cacheKey + "/");
        }

        public function resume():void
        {
            var _local_1:* = null;
            if (((_paused) && (!(_disposed))))
            {
                _paused = false;
                if (((!(_SafeStr_4211)) && (_SafeStr_8086)))
                {
                    _downloadEndTime = -1;
                    _downloadStartTime = getTimer();
                    if (hasDefinition(_name))
                    {
                        _SafeStr_14.log(("[LibraryLoader] Found in AIR: " + _name));
                        _local_1 = new Timer(10, 1);
                        _local_1.addEventListener("timer", loadEventHandler);
                        _local_1.start();
                        return;
                    };
                    queue(this);
                };
            };
        }

        protected function retry():Boolean
        {
            if ((((!(_SafeStr_4211)) && (!(_disposed))) && (_downloadRetriesLeft > 0)))
            {
                try
                {
                    _SafeStr_8083.close();
                }
                catch(e:Error)
                {
                };
                addRequestCounterToUrlRequest(_SafeStr_8086, (5 - _downloadRetriesLeft));
                _downloadRetriesLeft--;
                _process = 0;
                _SafeStr_8083.load(_SafeStr_8086);
                return (true);
            };
            return (false);
        }

        public function hasDefinition(_arg_1:String):Boolean
        {
            if (_SafeStr_880.get(_arg_1))
            {
                _SafeStr_14.log(("[LibraryLoader] Definition in resources: " + _arg_1));
                return (true);
            };
            var _local_2:Boolean;
            try
            {
            }
            catch(e:Error)
            {
            };
            return (_local_2);
        }

        public function getDefinition(_arg_1:String):Object
        {
            if (_SafeStr_880.get(_arg_1))
            {
                return (_SafeStr_880.get(_arg_1));
            };
            var _local_2:Object;
            try
            {
                _local_2 = _SafeStr_8009[_arg_1];
            }
            catch(e:Error)
            {
            };
            return (_local_2);
        }

        protected function loadEventHandler(_arg_1:Event):void
        {
            var _local_3:* = null;
            var _local_2:Boolean;
            switch (_arg_1.type)
            {
                case "init":
                    debug((('Load event INIT for file "' + url) + '"'));
                    _process = (_process | 0x02);
                    break;
                case "open":
                    _process = (_process | 0x02);
                    debug((('Load event OPEN for file "' + url) + '"'));
                    break;
                case "complete":
                    debug((('Load event COMPLETE for file "' + url) + '"'));
                    if (((((!(_cachedBytes)) && (_cacheKey)) && (_cacheRevision)) && (!(_cacheRevision == "-1"))))
                    {
                        addToCache();
                    };
                    _process = (_process | 0x01);
                    break;
                case "enterFrame":
                    break;
                case "httpStatus":
                    _status = HTTPStatusEvent(_arg_1).status;
                    debug((((("Load event STATUS " + _status) + ' for file "') + url) + '"'));
                    break;
                case "unload":
                    debug((('Load event UNLOAD for file "' + url) + '"'));
                    dispatchEvent(new _SafeStr_43("LIBRARY_LOADER_EVENT_UNLOAD", _status, bytesTotal, bytesLoaded, elapsedTime));
                    break;
                case "progress":
                    debug(((((('Load event PROGRESS for file "' + url) + '"  bytes: ') + bytesLoaded) + "/") + bytesTotal));
                    dispatchEvent(new _SafeStr_43("LIBRARY_LOADER_EVENT_PROGRESS", _status, bytesTotal, bytesLoaded, elapsedTime));
                    break;
                case "ioError":
                    debug((('Load event IO ERROR for file "' + url) + '"'));
                    if (!handleHttpStatus(_status))
                    {
                        _downloadEndTime = getTimer();
                        failure((('IO Error, send or load operation failed for file "' + url) + '"'));
                        removeEventListeners();
                    };
                    break;
                case "securityError":
                    _downloadEndTime = getTimer();
                    failure((('Security Error, security violation with file "' + url) + '"'));
                    removeEventListeners();
                    break;
                case "timer":
                    _local_3 = (TimerEvent(_arg_1).target as Timer);
                    _local_3.removeEventListener("timer", loadEventHandler);
                    _local_3.stop();
                    if (!_disposed)
                    {
                        _process = 7;
                        loadEventHandler(new Event("complete"));
                    };
                    return;
                default:
            };
            if (_process == 3)
            {
                if (analyzeLibrary())
                {
                    _process = (_process | 0x04);
                };
            };
            if (_process == 7)
            {
                _local_2 = prepareLibrary();
                if (_local_2)
                {
                    _SafeStr_4211 = true;
                    _downloadEndTime = getTimer();
                    removeEventListeners();
                    throttle();
                    dispatchEvent(new _SafeStr_43("LIBRARY_LOADER_EVENT_COMPLETE", _status, bytesTotal, bytesLoaded, elapsedTime));
                    dispatchEvent(new Event("LIBRARY_LOADER_FINALIZE"));
                };
            };
        }

        private function addToCache():void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_1:* = null;
            if (((fileProxy) && (_SafeStr_8083)))
            {
                _local_2 = (_SafeStr_8083.data as ByteArray);
                if (((!(_local_2)) || (_local_2.length == 0)))
                {
                    return;
                };
                _local_3 = getCacheDirectoryPath();
                fileProxy.deleteCacheDirectory(_local_3);
                _local_1 = getCacheFilePath();
                fileProxy.writeCacheAsync(_local_1, _SafeStr_8083.data);
            };
        }

        protected function analyzeLibrary():Boolean
        {
            var _local_1:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:uint;
            debug((((('Analyzing library "' + _name) + '", content ') + ((content is MovieClip) ? "is" : "is not")) + " a MovieClip"));
            if ((content is MovieClip))
            {
                _local_1 = (content as MovieClip);
                _local_4 = _local_1.currentLabels;
                debug((((((('\tLibrary "' + _name) + '" is in frame ') + _local_1.currentFrame) + "(") + _local_1.currentLabel) + ")"));
                if (_local_4.length > 1)
                {
                    _local_2 = 0;
                    while (_local_2 < _local_4.length)
                    {
                        _local_3 = (_local_4[_local_2] as FrameLabel);
                        if (_local_3.name == _name)
                        {
                            if (_local_3.frame != _local_1.currentFrame)
                            {
                                _local_1.addEventListener("enterFrame", loadEventHandler);
                                return (false);
                            };
                        };
                        _local_2++;
                    };
                };
            };
            return (true);
        }

        [SecureSWF(controlFlow="0")]
        protected function prepareLibrary():Boolean
        {
            var _local_1:Boolean;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            if (disposed)
            {
                return (false);
            };
            var _local_7:Boolean = true;
            if (_SafeStr_880.get(_name))
            {
                _local_7 = false;
            };
            if (_local_7)
            {
                _local_2 = parseNameFromUrl(_SafeStr_8086.url);
                _SafeStr_8009 = Class;
                if (((_cachedBytes) && (_cachedBytes.length > 0)))
                {
                    try
                    {
                        _local_6 = makeSWF(_local_2, _cachedBytes, _SafeStr_8009);
                        _cachedBytes.clear();
                        _cachedBytes = null;
                    }
                    catch(e:Error)
                    {
                        fileProxy.deleteCacheDirectory(getCacheDirectoryPath());
                        _cachedBytes.clear();
                        _cachedBytes = null;
                        if (!retry())
                        {
                            failure((((('Failed to load resource "' + _name) + '" from library ') + _SafeStr_8086.url) + "!"));
                        };
                    };
                    if (!_local_6)
                    {
                        return (false);
                    };
                }
                else
                {
                    _local_4 = _SafeStr_8083.data;
                    if (((_local_4) && (_local_4.length > 0)))
                    {
                        var _local_10:int = 0;
                        try
                        {
                            _local_6 = makeSWF(_local_2, _local_4, _SafeStr_8009);
                        }
                        catch(e:Error)
                        {
                            if (!retry())
                            {
                                failure((((('Failed to load resource "' + _name) + '" from library ') + _SafeStr_8086.url) + "!"));
                            };
                        }
                        finally
                        {
                            _local_4.clear();
                        };
                    };
                };
                _local_1 = ((!(_local_6 == null)) && (_local_6.length > 0));
            }
            else
            {
                _SafeStr_8009 = (this.getDefinition(_name) as Class);
                if (_SafeStr_8009 == null)
                {
                    if (!retry())
                    {
                        failure((((('Failed to find resource class "' + _name) + '" from library ') + _SafeStr_8086.url) + "!"));
                    };
                    return (false);
                };
                _local_1 = true;
                try
                {
                    _local_3 = (_SafeStr_8009.manifest as Class);
                    if (_local_3 == null)
                    {
                        var _local_13:Boolean = false;
                        return (_local_13);
                    };
                }
                catch(e:Error)
                {
                    if (!retry())
                    {
                        failure((("Failed to find embedded manifest.xml from library " + _SafeStr_8086.url) + "!"));
                    };
                    _local_1 = false;
                };
                if (!_local_1)
                {
                    return (false);
                };
                _local_6 = (new (_local_3)() as ByteArray);
            };
            var _local_5:String = "";
            if (_local_1)
            {
                try
                {
                    _manifest = new XML(_local_6.readUTFBytes(_local_6.length));
                }
                catch(e:Error)
                {
                    _local_5 = e.message;
                    _local_1 = false;
                };
            };
            if (((!(_local_1)) && (!(retry()))))
            {
                failure(((((("Failed to extract manifest.xml from library " + _name) + " swf: ") + _local_2) + "!") + _local_5));
            };
            _local_6.clear();
            return (_local_1);
        }

        protected function handleHttpStatus(_arg_1:int):Boolean
        {
            if (((_arg_1 == 0) || (_arg_1 >= 400)))
            {
                if (retry())
                {
                    return (true);
                };
                failure((((("HTTP Error " + _arg_1) + ' "') + _SafeStr_8083) + '"'));
                removeEventListeners();
            };
            return (false);
        }

        protected function removeEventListeners():void
        {
            if (_SafeStr_8083)
            {
                _SafeStr_8083.removeEventListener("open", loadEventHandler);
                _SafeStr_8083.removeEventListener("complete", loadEventHandler);
                _SafeStr_8083.removeEventListener("progress", loadEventHandler);
                _SafeStr_8083.removeEventListener("unload", loadEventHandler);
                _SafeStr_8083.removeEventListener("httpStatus", loadEventHandler);
                _SafeStr_8083.removeEventListener("ioError", loadEventHandler);
                _SafeStr_8083.removeEventListener("securityError", loadEventHandler);
            };
        }

        protected function debug(_arg_1:String):void
        {
            _SafeStr_79.debug(_arg_1);
            _debugMsg = _arg_1;
            if (_SafeStr_4414)
            {
                dispatchEvent(new _SafeStr_43("LIBRARY_LOADER_EVENT_DEBUG", _status, bytesTotal, bytesLoaded, elapsedTime));
            };
        }

        protected function failure(_arg_1:String):void
        {
            _SafeStr_79.warning(_arg_1);
            _errorMsg = _arg_1;
            throttle();
            dispatchEvent(new _SafeStr_43("LIBRARY_LOADER_EVENT_ERROR", _status, bytesTotal, bytesLoaded, elapsedTime));
            dispatchEvent(new Event("LIBRARY_LOADER_FINALIZE"));
        }

        public function getLastDebugMessage():String
        {
            return (_debugMsg);
        }

        public function getLastErrorMessage():String
        {
            return (_errorMsg);
        }


    }
}//package com.sulake.core.utils

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_3543 = "_-uy" (String#10370, DoABC#3)
// _SafeStr_39 = "_-N4" (String#8085, DoABC#3)
// _SafeStr_4211 = "_-pm" (String#10021, DoABC#3)
// _SafeStr_43 = "_-gV" (String#9427, DoABC#3)
// _SafeStr_4414 = "_-SP" (String#8443, DoABC#3)
// _SafeStr_68 = "_-H1s" (String#7683, DoABC#3)
// _SafeStr_79 = "_-411" (String#6798, DoABC#3)
// _SafeStr_8009 = "_-3U" (String#6779, DoABC#3)
// _SafeStr_8083 = "_-3T" (String#6778, DoABC#3)
// _SafeStr_8084 = "_-p1Q" (String#9986, DoABC#3)
// _SafeStr_8085 = "_-S1z" (String#8428, DoABC#3)
// _SafeStr_8086 = "_-8N" (String#7126, DoABC#3)
// _SafeStr_8087 = "_-Mg" (String#8035, DoABC#3)
// _SafeStr_880 = "_-o1k" (String#9934, DoABC#3)


