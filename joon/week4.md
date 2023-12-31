# 외래키

외래키는 관계형 데이터베이스 관리 시스템에서 중요한 개념으로 데이터 베이스 내의 두 개의 테이블 간에 관계를 설정하는 역할을 한다. 

- 외래 키는 데이터베이스에서 참조 무결성을 강제하는데 사용된다.
- 참조 테이블의 기본 키 열에 있는 값들이 참조하는 테이블의 외래 키 열에도 존재해야 한다.
</br>
</br>

# 기본키
기본 키는 RDBMS에서 사용되는데, 데이터베이스 테이블에서 레코드를 고유하게 식별하는데 사용된다.

- 기본 키 값은 각 레코드에서 고유해야 한다.
- 기본 키 값은 중복 없이 유일해야 한다.
- 기본 키 값은 NULL이 될 수 없다.
- 기본 키 값은 레코드가 삽입된 후에는 변경되지 않아야 한다.
- 기본 키는 데이터를 빠르게 검색하고 효과적으로 조인하는데 도움을 준다.

</br>
</br>
# ER 다이어그램

데이터 모델링의 도구 중 하나로, 데이터베이스 설계와 시스템 분석에 사용된다. 

데이터베이스의 구조와 데이터 간의 관계를 시각적으로 나타내기 위해 사용한다.

구성요소

- 엔티티 : 엔티티는 데이터베이스에서 저장할 정보의 주요 개체나 개념을 나타낸다.
- 속성 : 속성은 엔티티의 특징이나 데이터 요소를 나타낸다.
- 관계 : 관계는 엔티티 간의 상호 작용을 나타낸다.
- 기본 키: 엔티티의 각 레코드를 고유하게 식별하는데 사용되는 속성이다.
- Cardinality: 연결된 엔티티 간의 레코드 수 관계를 설명한다.

</br>
</br>

# 복합키
데이터 베이스에서 레코드를 고유하게 식별하는 데 사용되는 키의 형태 중 하나이다. 복합키는 하나의 열이 아니라 두 개 이상의 열로 구성되며, 이러한 열의 조합이 레코드를 고유하게 식별한다.

복합키는 특정 데이터 모델링 상황에서 유용한 도구로 사용되며, 하나의 열로는 충분하지 않은 고유 식별이 필요한 경우에 활용된다.
</br>
</br>

# 연관관계

데이터 베이스에서 테이블 간의 상호작용을 나타내는 중요한 개념이다.

연관관계는 데이터 모델링과 데이터베이스 설계에서 사용되며, 테이블 간의 연결을 정의하고 데이터의 일관성을 유지하는데 도움이 된다.

연결 유형 : 연관관계에는 1:1 , 1:N, N:1, N:N 이 있다. 

연관 관계는 데이터베이스 설계와 데이터 베이스 쿼리 작성에서 중요한 역할을 한다. 데이터의 구조와 상호작용을 명확하게 정의하고, 데이터베이스에서 원하는 정보를 효과적으로 검색하고 조작하는데 도움을 준다.

</br>
</br>

# 정규화
데이터베이스 설계 과정에서 사용되는 기술로, 데이터 중복을 최소화하고 데이터의 무결성을 유지하기 위해 데이터를 구조화하는 프로세스이다. 

정규화는 데이터베이스 테이블을 여러 개의 relation으로 나누고, 각 relation 간의 관계를 정의함으로써 데이터 중복과 이상 현상을 최소화 한다.

정규화에는 여러 레벨이 있고 1차 정규화부터 5차 정규화까지의 레벨이 사용된다.

1차 정규화

- 각 열은 Atomic Value를 가져야 한다. 각 열에는 중첩된 구조나 배열이 없어야 한다.

2차 정규화

- 1차 정규화를 충족하면서 부분 종속성을 제거한다.
- 부분 종속성은 기본 키의 일부 열이 다른 열에 종속되는 경우를 나타낸다.

3차 정규화

- 2차 정규화를 충족하면서, 이행 종속성을 제거한다.
- 이행 종속성은 열 A가 열 B에 종속되고, 열 B가 열 C에 종속되는 경우를 나타낸다.
- 열 A와 열 C 간의 종속성을 제거하여 데이터 중복을 최소화한다.

BCNF

- BCNF는 3차 정규화를 확장한 것으로, 모든 결정자가 후보키이어야 한다.
- 결정자는 다른 열의 값을 결정하는 열을 의미하며, 후보 키는 유일한 식별자로 사용할 수 있는 열의 집합이다.

4차 정규화

- 다중 값 종속성을 제거한다.
- 다중 값 종속성은 한 열의 값이 여러 개의 다중 값 집합에 종속 되는 경우를 나타낸다.

5차 정규화

- 조인 종속성을 제거한다.
- 조인 종속성은 여러 테이블 간의 조인 연산으로 인해 데이터 중복이 발생하는 경우를 나타낸다.
</br>
</br>

# 반 정규화

데이터 베이스 설계에서 정규화된 데이터 모델을 조정하여 성능 향상을 목적으로 데이터 중복을 허용하는 프로세스를 의미한다. 

정규화는 데이터 중복을 최소화하고 데이터 일관성을 유지하기 위해 사용되지만, 반 정규화는 데이터를 더 직접적으로 검색하고 조직할 수 있도록 설계된 데이터 베이스에서 성능을 향상시키기 위해 사용된다.
    
    반정규화로 기대되는 효과
    
    - 조회 속도 향상
    - 복잡한 쿼리 간소화
    - 적은 리소스 사용
    
    반 정규화 수행 방법
    
    테이블 병합 : 관련된 정보를 하나의 테이블에 통합하여 조인 연산을 줄인다.
    
    중복 데이터 추가 : 데이터 중복을 허용하고 필요한 정보를 여러 테이블에 중복 저장한다. 그러면 데이터를 더 빠르게 검색할 수 있다.
    
    인덱싱 : 반 정규화된 데이터를 빠르게 검색하기 위해 적절한 인덱스를 추가한다.
