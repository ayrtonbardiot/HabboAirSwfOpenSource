// by nota

//com.sulake.core.utils.LibraryLoaderQueue

package com.sulake.core.utils
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime._SafeStr_13;

    public class LibraryLoaderQueue extends EventDispatcherWrapper implements _SafeStr_13 
    {

        protected static const MAX_SIMULTANEOUS_DOWNLOADS:int = 4;

        private var _SafeStr_4414:Boolean = false;
        private var _SafeStr_5504:Array = [];
        private var _loaders:Array = [];

        public function LibraryLoaderQueue(_arg_1:Boolean=false)
        {
            _SafeStr_4414 = _arg_1;
            super();
        }

        public function get length():int
        {
            return (_SafeStr_5504.length + _loaders.length);
        }

        override public function dispose():void
        {
            var _local_1:* = null;
            if (!disposed)
            {
                for each (_local_1 in _loaders)
                {
                    _local_1.dispose();
                };
                for each (_local_1 in _SafeStr_5504)
                {
                    _local_1.dispose();
                };
                _loaders = null;
                _SafeStr_5504 = null;
                super.dispose();
            };
        }

        public function push(_arg_1:_SafeStr_39):void
        {
            if ((((!(disposed)) && (!(isUrlInQueue(_arg_1.url)))) && (!(findLibraryLoaderByURL(_arg_1.url)))))
            {
                if (_arg_1.paused)
                {
                    _SafeStr_5504.push(_arg_1);
                }
                else
                {
                    _loaders.push(_arg_1);
                };
                _arg_1.addEventListener("LIBRARY_LOADER_EVENT_COMPLETE", libraryLoadedHandler);
                _arg_1.addEventListener("LIBRARY_LOADER_EVENT_PROGRESS", loadProgressHandler);
                _arg_1.addEventListener("LIBRARY_LOADER_EVENT_DISPOSE", loaderDisposeHandler);
                _arg_1.addEventListener("LIBRARY_LOADER_EVENT_ERROR", loadErrorHandler);
                next();
            };
        }

        private function next():void
        {
            var _local_1:* = null;
            if (!disposed)
            {
                while (((_loaders.length < 4) && (_SafeStr_5504.length > 0)))
                {
                    _local_1 = _SafeStr_5504.shift();
                    _loaders.push(_local_1);
                    _local_1.resume();
                };
            };
        }

        private function libraryLoadedHandler(_arg_1:_SafeStr_43):void
        {
            var _local_2:_SafeStr_39 = (_arg_1.target as _SafeStr_39);
            if (_local_2)
            {
                removeLoader(_local_2);
            };
            next();
        }

        private function loadProgressHandler(_arg_1:_SafeStr_43):void
        {
            var _local_2:_SafeStr_39 = (_arg_1.target as _SafeStr_39);
        }

        private function loaderDisposeHandler(_arg_1:_SafeStr_43):void
        {
            var _local_2:_SafeStr_39 = (_arg_1.target as _SafeStr_39);
            removeLoader(_local_2);
            next();
        }

        private function loadErrorHandler(_arg_1:_SafeStr_43):void
        {
            var _local_2:_SafeStr_39 = (_arg_1.target as _SafeStr_39);
            if (_local_2)
            {
                removeLoader(_local_2);
            };
            next();
        }

        private function removeLoader(_arg_1:_SafeStr_39):void
        {
            var _local_2:int;
            _arg_1.removeEventListener("LIBRARY_LOADER_EVENT_COMPLETE", libraryLoadedHandler);
            _arg_1.removeEventListener("LIBRARY_LOADER_EVENT_PROGRESS", loadProgressHandler);
            _arg_1.removeEventListener("LIBRARY_LOADER_EVENT_DISPOSE", loaderDisposeHandler);
            _arg_1.removeEventListener("LIBRARY_LOADER_EVENT_ERROR", loadErrorHandler);
            try
            {
                _local_2 = _SafeStr_5504.indexOf(_arg_1);
                if (_local_2 > -1)
                {
                    _SafeStr_5504.splice(_local_2, 1);
                };
                _local_2 = _loaders.indexOf(_arg_1);
                if (_local_2 > -1)
                {
                    _loaders.splice(_local_2, 1);
                };
            }
            catch(e:Error)
            {
            };
        }

        private function isUrlInQueue(_arg_1:String, _arg_2:Boolean=true):Boolean
        {
            if (!disposed)
            {
                if (((_arg_2) && (_arg_1.indexOf("?") > -1)))
                {
                    _arg_1 = _arg_1.slice(0, _arg_1.indexOf("?"));
                };
                for each (var _local_3:_SafeStr_39 in _SafeStr_5504)
                {
                    if (_arg_2)
                    {
                        if (_local_3.url.indexOf(_arg_1) == 0)
                        {
                            return (true);
                        };
                    }
                    else
                    {
                        if (_local_3.url == _arg_1)
                        {
                            return (true);
                        };
                    };
                };
            };
            return (false);
        }

        public function findLibraryLoaderByURL(_arg_1:String, _arg_2:Boolean=true):_SafeStr_39
        {
            if (!disposed)
            {
                if (((_arg_2) && (_arg_1.indexOf("?") > -1)))
                {
                    _arg_1 = _arg_1.slice(0, _arg_1.indexOf("?"));
                };
                for each (var _local_3:_SafeStr_39 in _loaders)
                {
                    if (_arg_2)
                    {
                        if (_local_3.url.indexOf(_arg_1) == 0)
                        {
                            return (_local_3);
                        };
                    }
                    else
                    {
                        if (_local_3.url == _arg_1)
                        {
                            return (_local_3);
                        };
                    };
                };
            };
            return (null);
        }


    }
}//package com.sulake.core.utils

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_39 = "_-N4" (String#8085, DoABC#3)
// _SafeStr_43 = "_-gV" (String#9427, DoABC#3)
// _SafeStr_4414 = "_-SP" (String#8443, DoABC#3)
// _SafeStr_5504 = "_-c1y" (String#9129, DoABC#3)


