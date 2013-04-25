Name:       patterns-nemo-apps
Summary:    Provides pattern '%{name}'
Version:    011
Release:    1
Group:      Packaging/Patterns
License:    GPLv2
BuildArch:  noarch
URL:        https://github.com/nemomobile/nemo-patterns
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  repomd-pattern-builder
Provides:   package-groups

%description
%{summary}.

%prep
%setup -q -n %{name}-%{version}

%build

%install
rm -rf %{buildroot}
export VERSION=%{version}
export RELEASE=%{release}
%make_install

%files
%defattr(-,root,root,-)
%{_datadir}/package-groups/*.xml
