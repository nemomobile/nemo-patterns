Name:       patterns-nemo-mw
Summary:    Provides patterns for nemo mobile mw repository.
Version:    002
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
%make_install

%files
%defattr(-,root,root,-)
%{_datadir}/package-groups/*.xml
